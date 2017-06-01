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
      render 'experiments#new'
    end
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  def edit
    # puts "*********EDIT EDIT EDIT*******"
    @experiment = Experiment.find(params[:id])
    @experiment_proposal = ExperimentProposal.find(params[:experiment_proposal_id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    # puts "****************"
    puts @experiment
    # puts "****************"
    if @experiment.update_attributes(experiment_params)
      redirect_to :back
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
