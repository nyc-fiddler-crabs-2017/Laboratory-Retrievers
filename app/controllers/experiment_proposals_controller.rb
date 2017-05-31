class ExperimentProposalsController < ApplicationController
  def index
    @experiment_proposals = ExperimentProposal.order('created_at DESC')
  end

  def show
    @experiment_proposal = ExperimentProposal.find_by(id: params[:id])
  end
end
