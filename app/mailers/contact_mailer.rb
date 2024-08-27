class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to:'thebrewingcompanytestemail@gmail.com', subject: 'New Contact Form Message')
  end
end
