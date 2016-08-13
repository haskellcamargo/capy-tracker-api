class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find_by session: params[:id]
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    @contact.save
    redirect_to controller: 'contacts',
                action: 'show',
                id: @contact.session
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :session)
    end
end
