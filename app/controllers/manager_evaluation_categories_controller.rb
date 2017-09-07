require_dependency 'application_controller'

class ManagerEvaluationCategoriesController < ApplicationController
  before_action :set_store
  before_action :set_context 
  before_action :set_categories 
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @category = ManagerEvaluationCategoryForm.where(context_id: @context.id).new
  end

  def create
    @category = ManagerEvaluationCategoryForm.where(context_id: @context.id).new(set_params)
    @category.save
  end

  def edit
  end

  def update
    @category.update(set_params)
  end

  def destroy
    @category.destroy
  end

  private

  def set_params
    params.require(:manager_evaluation_category_form)
      .permit(:name, :minimum_score)
  end


  def set_category
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_context
    @context = StoreContext.where(store_id: @store.id).find(params[:context_id])
  end

  def set_categories
    @categories = ManagerEvaluationCategoryForm.where(context_id: @context.id)
  end

end