class ExperimentsController < ApplicationController
  include UsersHelper
  def index
    @experiments = Experiment.all
  end

  def new
    @experiment_proposal = ExperimentProposal.find(params[:experiment_proposal_id])
    @experiment = Experiment.new
  end

  def create

    @experiment = current_user.experiments.new(experiment_params)
    if @experiment.save
      redirect_to @experiment.experiment_proposal
    else
      @experiment_proposal = ExperimentProposal.find(params[:experiment_proposal_id])
      @experiment = Experiment.new
      render 'new'
    end
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  def edit
    @experiment = Experiment.find(params[:id])
    @experiment_proposal = ExperimentProposal.find(params[:experiment_proposal_id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    puts @experiment
    if @experiment.update_attributes(experiment_params)
      redirect_to action: "show", id: @experiment.id
    else
      render 'edit'
    end
  end

  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy

    redirect_to experiments_path
  end
  private
  def experiment_params
    params.require(:experiment).permit(:title, :result, :conclusion, :status, :experiment_proposal_id)
  end

end
