class ExperimentProposalsController < ApplicationController
  include UsersHelper
  def index
    @experiment_proposals = ExperimentProposal.order('created_at DESC')
  end

  def show
    @experiment_proposal = ExperimentProposal.find_by(id: params[:id])
  end

  def new

  end

  def create
      @experiment_proposal = current_user.experiment_proposals.new(experiment_proposal_params)
      if @experiment_proposal.save
        redirect_to @experiment_proposal
      else
        @errors = @experiment_proposal.errors.full_messages
        render :new
      end
  end

  private
    def experiment_proposal_params
      params.require(:experiment_proposal).permit(:title, :summary, :hypothesis)
    end
end
