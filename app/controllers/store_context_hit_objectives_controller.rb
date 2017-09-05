class StoreContextHitObjectivesController < ApplicationController
  before_action :set_store
  before_action :set_context
  before_action :set_objective

  def new

    @hit = @objective.hit_objectives

    if @hit.present?
      @hit.destroy_all
    else
      @hit = @objective.hit_objectives.new
      @hit.save
    end
  end


  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_context
    @context = StoreContext.where(store_id: @store.id).find(params[:context_id])
  end

  def set_objective
    @objective = StoreContextObjective.where(context_id: @context.id).find(params[:objective_id])
  end

end