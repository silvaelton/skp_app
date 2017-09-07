class ManagerEvaluationsController < ApplicationController
  before_action :set_store
  before_action :set_context
  before_action :set_category
  before_action :set_evaluations
  before_action :set_evaluation, only: [:update, :edit, :destroy]

  def index
  end

  def new
    @evaluation = ManagerEvaluationForm.where(category_id: @category.id).new
  end

  def create
    @evaluation = ManagerEvaluationForm.where(category_id: @category.id).new(set_params)
    
    if @evaluation.save
      redirect_to action: :index
    end
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
      .permit(multi_score: [:score])
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

  def set_category
    @category = ManagerEvaluationCategory.where(context_id: @context.id).find(params[:evaluation_category_id])
  end

  def set_evaluations
    @evaluations = ManagerEvaluationForm.where(category: @category.id)
  end

end