require 'digest/md5'

class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find params[:id]
    @hash = Digest::MD5.hexdigest(@contact.email.strip)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
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
