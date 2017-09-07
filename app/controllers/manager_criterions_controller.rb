class ManagerCriterionsController < ApplicationController
  before_action :set_store
  before_action :set_context
  before_action :set_criterions
  before_action :set_criterion, only: [:update, :edit, :destroy]

  def index
  end

  def new
    @criterion = ManagerCriterionForm.where(context_id: @context.id).new
  end

  def create
    @criterion = ManagerCriterionForm.where(context_id: @context.id).new(set_params)
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
    params.require(:manager_criterion_form)
      .permit(:name)
  end

  def set_criterion
    @criterion = ManagerCriterionForm.where(context_id: @context).find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_context
    @context = StoreContext.where(store_id: @store.id).find(params[:context_id])
  end

  def set_criterions
    @criterions = ManagerCriterionForm.where(context_id: @context.id)
  end

end