class WizardDashboardController < ApplicationController
  before_action :authenticate_wizard!, :claimed
  helper_method :to_claim

  def to_claim
    @to_claim = User.where(event_status: true).where(claim_status: false).order(event_time: :desc).first
  end

  def dash
    @open_events = User.where(event_status: true).where(claim_status: false).order(event_time: :desc)
  end

  def claim
    @claimed = to_claim
    @claimed.update(claim_status: true, active_wizard: current_wizard.id)
    current_wizard.update(working_magic: true)
    redirect_to dashboard_path
  end

  def number
    # @claimed = to_claim
  end

  def disconnect
    current_wizard.update(working_magic: false)
    @claimed_user.update(active_wizard: nil, claim_status: false, event_status: false)
    redirect_to dashboard_path
  end

  private
    def claimed
      @claimed_user = User.find_by(active_wizard: current_wizard.id)
    end
end
