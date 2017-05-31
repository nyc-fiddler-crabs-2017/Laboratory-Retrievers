class ExperimentProposalsController < ApplicationController
  def index
    @experiment_proposals = ExperimentProposal.all
  end
end
