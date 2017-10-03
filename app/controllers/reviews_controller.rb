class ReviewsController < ApplicationController
  def new
    # we need @cocktail in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new

  end

  def create
     @review = Review.new(review_params)
    # we need `cocktail_id` to asssociat)te review with corresponding cocktail
    @review.cocktail = Cocktail.find(params[:cocktail_id])
    @review.save
    redirect_to(cocktail_path(@review.cocktail))
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
