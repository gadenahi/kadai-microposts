class RelationshipLikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'MicropostをLikeしました'
#    redirect_to root_url
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'MicropostをUnlikeしました'
    redirect_back(fallback_location: root_path)
  end
end
