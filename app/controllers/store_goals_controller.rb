class StoreGoalsController < ApplicationController
  before_action :set_store
  before_action :set_context
  before_action :set_goal, only: [:edit, :update, :show, :destroy]

  def new
    @goal = StoreGoalForm.where(context_id: @context.id).new
  end

  def create
    @goal = StoreGoalForm.where(context_id: @context.id).new(set_params)
    @goal.save
  end


  def edit
  end 

  def update
    @goal.update(set_params)
  end

  def destroy
    @goal.destroy
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_context
    @context = StoreContext.where(store_id: @store.id).find(params[:context_id])
  end

  def set_goal
    @goal   = StoreGoalForm.where(context_id: @context.id).find(params[:id])
  end

  def set_params
    params.require(:store_goal_form)
      .permit(:name, :description, :minimum_value, :goal_value, 
              :exceed_minimum_percent, :exceed_goal_percent, :fixed_exceed_goal_value)
  end
end