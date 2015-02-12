class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end
# user_signed_in?
# current_user
end