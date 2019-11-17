class ProfilesController < ApplicationController
  def profile
    redirect_to '/users/sign_in' unless user_signed_in?
    @user = current_user
  end
end
