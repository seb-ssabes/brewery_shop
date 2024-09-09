class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # if Rails.env.production?
        redirect_to new_contact_path, notice: 'We\'re sorry. This feature is under maintenance. Please contact us at thebrewingcompany@beer.com'
      # else
      #   ContactMailer.contact_email(@contact).deliver_now
      #   redirect_to new_contact_path, notice: 'Message sent successfully.'
      # end
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :comment)
  end
end
