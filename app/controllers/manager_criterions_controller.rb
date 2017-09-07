class ManagerCriterionsController < ApplicationController
  before_action :set_store
  before_action :set_context
  before_action :set_category

  before_action :set_criterions
  before_action :set_criterion, only: [:update, :edit, :destroy]

  def index
  end

  def new
    @criterion = ManagerEvaluationCriterionForm.where(category_id: @category.id).new
  end

  def create
    @criterion = ManagerEvaluationCriterionForm.where(category_id: @category.id).new(set_params)
    @criterion.save
  end
  
  def edit
  end

  def update
    @criterion.update(set_params)
  end

  def destroy
    @criterion.destroy
  end

  private

  def set_params
    params.require(:manager_evaluation_criterion_form)
      .permit(:name)
  end

  def set_criterion
    @criterion = ManagerEvaluationCriterionForm.where(category_id: @category).find(params[:id])
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


  def set_criterions
    @criterions = ManagerEvaluationCriterionForm.where(category_id: @category.id)
  end

end