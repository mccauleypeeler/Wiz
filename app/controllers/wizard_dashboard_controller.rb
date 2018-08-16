class WizardDashboardController < ApplicationController
  before_action :authenticate_wizard!
  helper_method :to_claim

  def to_claim
    @to_claim = User.where(event_status: true).where(claim_status: false).order(event_time: :desc).first
  end

  def dash
    @open_events = User.where(event_status: true).where(claim_status: false).order(event_time: :desc)
  end

  def claim
    to_claim.update(claim_status: true)
    current_wizard.update(working_magic: true)

    redirect_to number_path(id: to_claim.id)
  end

  def number
    @claimed = to_claim
  end

  def disconnect
    current_wizard.update(working_magic: false)
    to_claim.update(active_wizard: nil)
    redirect_to dashboard_path
  end
end
