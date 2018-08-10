class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def login
    redirect_to show_dash_path
  end

  def show
    @user = current_user
  end

  def tog
    @user = current_user
    if @user.event_status
      @user.update(event_status: false)
    else
      @user.update(event_status: true, event_time: Time.now)
    end
    redirect_to show_dash_path
  end
end
