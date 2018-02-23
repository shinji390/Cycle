class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: @contact.email, subject: '【Cycle】お問い合わせの確認メール'
  end
end
