class WizardDashboardController < ApplicationController
  before_action :authenticate_wizard!

  def dash
    @open_events = User.where(event_status: true).where(claim_status: false).order(event_time: :desc)
  end

  def claim
    @to_claim = User.where(event_status: true).where(claim_status: false).order(event_time: :desc).first
    @to_claim.update(claim_status: true)
    current_wizard.update(working_magic: true)
    redirect_to number_path(id: @to_claim.id)
  end

  def number
    @claimed = User.find(params[:id])
  end
end
