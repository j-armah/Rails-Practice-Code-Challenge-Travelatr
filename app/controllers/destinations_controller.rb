class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
    @recent_posts = @destination.posts.last(5)
    @average = @destination.avg_age
    @featured_post = @destination.most_liked
  end


end
