class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # if Rails.env.production?
        redirect_to new_contact_path, notice: 'Thank you for your message. We\'ll get back to you soon'
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
