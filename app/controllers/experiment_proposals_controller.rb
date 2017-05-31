class ExperimentProposalsController < ApplicationController
  def index
    @experiment_proposals = ExperimentProposal.order('created_at DESC')
  end
end
