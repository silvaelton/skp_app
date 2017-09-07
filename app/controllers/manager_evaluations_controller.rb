class ManagerEvaluationsController < ApplicationController
  before_action :set_store
  before_action :set_context
  before_action :set_evaluations
  before_action :set_evaluation, only: [:update, :edit, :destroy]

  def index
  end

  def new
    @evaluation = ManagerEvaluationForm.where(context_id: @context.id).new
  end

  def create
    @evaluation = ManagerEvaluationForm.where(context_id: @context.id).new(set_params)
    @evaluation.save
  end
  
  def edit
  end

  def update
    @evaluation.update(set_params)
  end

  def destroy
    @evaluation.destroy
  end

  private

  def set_params
    params.require(:manager_evaluation_form)
      .permit(:name)
  end

  def set_evaluation
    @evaluation = ManagerEvaluationForm.where(context_id: @context).find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_context
    @context = StoreContext.where(store_id: @store.id).find(params[:context_id])
  end

  def set_evaluations
    @evaluations = ManagerEvaluationForm.where(context_id: @context.id)
  end

end