class UserMailer < ApplicationMailer
  default from: 'alibrarymanagementsystem@gmail.com'
  layout "mailer"

  def mailer(email_id, name, book_title, library_name)
    @user_name = name
    @book_title = book_title
    @library_name = library_name
    mail(to: email_id, subject: 'You have a new book available at ' + library_name + ' library!')
  end
end