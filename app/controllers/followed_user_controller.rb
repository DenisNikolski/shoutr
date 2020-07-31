class FollowedUserController < ApplicationController
  def create
    user_to_follow = user
    current_user.follow(user_to_follow)
    redirect_to user_to_follow
  end

  def destroy
    user_to_unfollow = user
    current_user.unfollow(user_to_unfollow)
    redirect_to user_to_unfollow
  end

  private

  def user
    @user ||= User.find_by_username(params[:id])
  end
end
