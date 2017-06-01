class ExperimentProposalsController < ApplicationController
  include UsersHelper
  def index
    unauthorized
    @experiment_proposals = ExperimentProposal.order('created_at DESC')
  end

  def show
    unauthorized
    @experiment_proposal = ExperimentProposal.find_by(id: params[:id])
    redirect_to "/experiment_proposals" unless @experiment_proposal
  end

  def new

  end

  def edit
    unauthorized
      @experiment_proposal = ExperimentProposal.find_by(id: params[:id])
      redirect_to "/experiment_proposals" unless @experiment_proposal
  end

  def create
    unauthorized
      @experiment_proposal = current_user.experiment_proposals.new(experiment_proposal_params)
      if @experiment_proposal.save
        redirect_to @experiment_proposal
      else
        @errors = @experiment_proposal.errors.full_messages
        render :new
      end
  end

  def update
    unauthorized
      @experiment_proposal = ExperimentProposal.find_by(id: params[:id])
      if @experiment_proposal.update(experiment_proposal_params)
        redirect_to @experiment_proposal
      else
        @errors = @experiment_proposal.errors.full_messages
        render :edit
      end
  end

  def destroy
    unauthorized
    @experiment_proposal = ExperimentProposal.find_by(id: params[:id])
    @experiment_proposal.destroy

    redirect_to experiment_proposals_path
  end

  private
    def experiment_proposal_params
      params.require(:experiment_proposal).permit(:title, :summary, :hypothesis, :status)
    end
end
