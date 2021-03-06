class WelcomeController < ApplicationController
  before_action :authenticate_user!
  helper_method :user

  def user
    @user = current_user
  end

  def login
    redirect_to show_dash_path
  end

  def show
  end

  def tog_on
    user.update(event_status: true, event_time: Time.now)
    redirect_to show_dash_path
  end

  def tog_off
    Wizard.find(current_user.active_wizard).update(working_magic: false)
    user.update(event_status: false, claim_status: false, active_wizard: 0)
    redirect_to show_dash_path
  end
end
