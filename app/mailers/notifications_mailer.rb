class NotificationsMailer < ActionMailer::Base
  default :to => "jensenlocksmithing@gmail.com"
  default :from => "jensenlocksmithing@gmail.com"
  def new_message(message)
    @message = message
    mail(:from => "#{message.email}", :subject => "Bid Request - #{message.subject}")
  end

  def new_review(review)
  	@review = review
  	mail( :subject => "New Review from #{review.first_name}")

  end

end
