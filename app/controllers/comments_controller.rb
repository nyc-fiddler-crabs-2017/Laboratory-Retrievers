class CommentsController < ApplicationController
  def new
    unauthorized
    @experiment = Experiment.find_by(id: params[:id])
    @experiment_proposal = ExperimentProposal.find_by(id: params[:id])
    @comment = Comment.new
    byebug
  end
end
