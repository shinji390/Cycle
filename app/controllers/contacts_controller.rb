class ContactsController < ApplicationController

  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to thanks_path
    else
      render 'new'
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    render 'new' if @contact.invalid?
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
