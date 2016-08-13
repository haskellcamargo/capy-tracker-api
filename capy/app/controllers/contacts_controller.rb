require 'digest/md5'

class ContactsController < ApplicationController
  def index
    @contacts = Contact.where.not(email: 'iunknown')
  end

  def show
    @contact = Contact.find params[:id]
    @hash = Digest::MD5.hexdigest(@contact.email.strip)
  end

  def new
    @contact = Contact.new
  end

  def destroy
    @contact = Contact.find params[:id]
    @contact.destroy

    redirect_to controller: 'contacts', action: :index
    #redirect_to contact_path
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :session)
    end
end
