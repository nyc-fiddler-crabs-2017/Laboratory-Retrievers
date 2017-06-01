class ObservationsController < ApplicationController

  def new
    unauthorized
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @experiment_proposal = @experiment.experiment_proposal
    @observation = Observation.new
  end

  def create
    unauthorized
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @observation = @experiment.observations.new(body: params[:observation][:body], user_id: current_user.id)
    if @observation.save
      redirect_to "/experiment_proposals/#{@experiment.experiment_proposal_id}/experiments/#{@experiment.id}"
    else
      redirect_to 'observation#new'
    end
  end

  def show
    unauthorized
    @observation = Observation.find(params[:id])
  end

  def edit
    unauthorized
    @observation = Observation.find(params[:id])
    if @observation.observable_type == "experiment"
      @experiment = @observation.observable
    else
      @procedure = @observation.observable
    end
  end

  def update
    unauthorized
    @observation = Observation.find(params[:id])
  end

  def destroy
    unauthorized
    @observation = Observation.find(params[:id])
    @observation.destroy
  end
end
