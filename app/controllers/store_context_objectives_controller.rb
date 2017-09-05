class StoreContextObjectivesController < ApplicationController
  before_action :set_store
  before_action :set_context
  before_action :set_objective, only: :destroy

  def new
    @objective = StoreContextObjectiveForm.where(context_id: @context.id).new
  end

  def create
    @objective = StoreContextObjectiveForm.where(context_id: @context.id).new(set_params)
    @objective.save
  end

  def edit
  end

  def update
    @objective.update(set_params)
  end

  def destroy
    @objective.destroy
  end
  
  private

  def set_objective
    @objective = StoreContextObjective.where(context_id: @context.id).find(params[:id])
  end
  
  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_context
    @context = StoreContext.where(store_id: @store.id).find(params[:context_id])
  end

  def set_params
    params.require(:store_context_objective_form)
      .permit(:name, :score, :status)
  end
end