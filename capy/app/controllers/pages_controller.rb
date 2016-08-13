class PagesController < ApplicationController
  def create
    @contact = Contact.find params[:contact_id]
    @page = @contact.pages.create(page_params)
    redirect_to controller: 'contacts',
                action: 'show',
                id: @contact.session
  end

  private
    def page_params
      params.require(:page).permit(
        :last_date, :last_duration, :browser_name, :browser_version,
        :url, :visits
      )
    end
end
