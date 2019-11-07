class PagesController < ApplicationController
  before_action :check_logged_in
  
  def home; end

  private
    def check_logged_in
      if user_signed_in?
        redirect_to '/posts/'
      end
    end
end
