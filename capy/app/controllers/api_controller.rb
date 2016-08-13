class ApiController < ActionController::Base
  def index
    @contacts = Contact.all
    respond_to do |format|
      format.json { render json: params }
    end
  end

  def create
    # Reducer
    case params[:type]
      when 'CONTACT'
        insert_contact(contact_params)
      when 'SESSION'
        track_page(params[:data])
      when 'DURATION'
        track_duration(params[:data])
      else
        render :status => 500, text: 'error'
    end
  end

  private
    def contact_params
      params.permit(:name, :email, :session)
    end

    def insert_contact(data)
      current_contact = Contact.find_by session: data[:session]

      # A contact happened previously
      if current_contact != nil && current_contact.email != 'unknown'
        render status: 200, text: 'ok'
        return
      end

      @contact = Contact.new(data)
      if @contact.save
        render status: 200, text: 'ok'
      else
        render status: 500, text: 'error'
      end
    end

    def track_page(data)
      @contact = Contact.find_by session: data[:session]

      if @contact == nil
        @contact = Contact.new({
          :name => 'Unknown',
          :email => 'unknown',
          :session => data[:session]
        })
        @contact.save
      end

      full_url = data[:url][:hostname] + data[:url][:pathname]

      current_page = @contact.pages.find_by url: full_url

      if current_page == nil
        page = @contact.pages.create({
          :url => data[:url][:hostname] + data[:url][:pathname],
          :last_date => data[:date],
          :last_duration => 0,
          :browser_name => data[:browser][:name],
          :browser_version => data[:browser][:version],
          :visits => 1
        })
        if page.save!
          render status: 200, text: 'ok'
        else
          render status: 500, text: 'error'
        end
      else
        current_page.update({
          :visits => current_page[:visits] + 1,
          :last_date => data[:date],
          :browser_name => data[:browser][:name],
          :browser_version => data[:browser][:version]
        })
        render status: 200, text: 'ok'
      end
    end

    def track_duration(data)
      @contact = Contact.find_by session: data[:session]
      full_url = data[:url][:hostname] + data[:url][:pathname]
      current_page = @contact.pages.find_by url: full_url

      if current_page != nil
        current_page.update({ :last_duration => data[:duration] })
      end
      render status: 200, text: 'ok'
    end
end

