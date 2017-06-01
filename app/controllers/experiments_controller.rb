class ExperimentsController < ApplicationController
  include UsersHelper
  def index
    @experiments = Experiment.all
  end

  def new
    unauthorized
    @experiment_proposal = ExperimentProposal.find(params[:experiment_proposal_id])
    redirect_to "/experiment_proposals/#{@experiment_proposal.id}" if @experiment_proposal.status == "Closed"
    @experiment = Experiment.new
  end

  def create
    unauthorized
    @experiment = current_user.experiments.new(experiment_params)
    if @experiment.save
      redirect_to action: "show", id: @experiment.id
    else
      @experiment_proposal = ExperimentProposal.find_by(id: params[:experiment_proposal_id])
      @experiment = Experiment.new
      render 'new'
    end
  end

  def show
    unauthorized
    @experiment = Experiment.find_by(id:params[:id])
    @experiment_proposal = ExperimentProposal.find_by(id: params[:experiment_proposal_id])
    redirect_to "/experiment_proposals" unless @experiment && @experiment_proposal
  end

  def edit
    unauthorized
    @experiment = Experiment.find_by(id: params[:id])
    @experiment_proposal = ExperimentProposal.find_by(id: params[:experiment_proposal_id])
    redirect_to "/experiment_proposals" unless @experiment && @experiment_proposal
  end

  def update
    unauthorized
    @experiment = Experiment.find_by(id: params[:id])
    puts @experiment
    if @experiment.update_attributes(experiment_params)
      redirect_to action: "show", id: @experiment.id
    else
      render 'edit'
    end
  end

  def destroy
    unauthorized
    @experiment = Experiment.find(params[:id])
    @experiment_proposal = ExperimentProposal.find(params[:experiment_proposal_id])
    @experiment.destroy
    redirect_to @experiment_proposal
  end

  private
  def experiment_params
    params.require(:experiment).permit(:title, :result, :conclusion, :status, :experiment_proposal_id)
  end

end
