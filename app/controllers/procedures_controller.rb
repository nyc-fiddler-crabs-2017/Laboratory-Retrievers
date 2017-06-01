class ProceduresController < ApplicationController
  def new
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @procedure = Procedure.new
  end

  def create
    @experiment = Experiment.find(params[:experiment_id])
    @experiment_proposal = @experiment.experiment_proposal
    @procedure = @experiment.procedures.new(procedure_params)
    if @procedure.save
      redirect_to "/experiment_proposals/#{@experiment_proposal.id}/experiments/#{@experiment.id}"
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
