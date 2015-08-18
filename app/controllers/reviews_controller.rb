class ReviewsController < ApplicationController

	def new
		@review = Review.new
	end

	def create
    @review = Review.new(params[:review])
    if @review.save
      NotificationsMailer.new_review(@review).deliver
      redirect_to root_path, :notice => "Thank you for leaving us a review!"
    else
      render "new"
    end
  end
end
