class ProceduresController < ApplicationController
  def new
    @experiment = Experiment.find(params[:experiment_id])

    render 'new'
  end

  def create
    @experiment = Experiment.find(params[:experiment_id])
    @procedure = @experiment.procedures.new(procedure_params)
    if @procedure.save
      redirect_to experiment_proposal_experiment_path(@experiment)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

  private
  def procedure_params
    params.require(:procedure).permit(:body, :step, :experiment_id)
  end
