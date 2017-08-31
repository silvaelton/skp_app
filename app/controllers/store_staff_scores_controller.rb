class StoreStaffScoresController < ApplicationController
  before_action :set_store
  before_action :set_context
  before_action :set_goal
  before_action :set_score, only: [:edit, :update, :destroy]

  def new
    @score = StoreStaffScoreForm.where(goal_id: @goal.id).new
  end

  def create
    @score = StoreStaffScoreForm.where(goal_id: @goal.id).new(set_params)
    @score.save
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_context
    @context = StoreContext.where(store_id: @store.id).find(params[:context_id])
  end

  def set_goal
    @goal    = StoreGoal.where(context_id: @context.id).find(params[:goal_id])
  end

  def set_score
    @score  = StoreStaffScoreForm.where(goal_id: @goal.id).find(params[:id])
  end

  def set_params
    params.require(:store_staff_score_form).permit(:staff_id, :score_value)
  end
end