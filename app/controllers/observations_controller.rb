class ObservationsController < ApplicationController

  def new
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @experiment_proposal = @experiment.experiment_proposal
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(params[:observation])
    if @observation.save
        redirect_to @observation.observable
    else
      render 'observation#new'
    end
  end

  def show
    @observation = Observation.find(params[:id])
  end


  def edit
    @observation = Observation.find(params[:id])
    if @observation.observable_type == "experiment"
      @experiment = @observation.observable
    else
      @procedure = @observation.observable
    end
  end

  def update
    @observation = Observation.find(params[:id])
  end

  def destroy
    @observation = Observation.find(params[:id])
    @observation.destroy
  end

end
