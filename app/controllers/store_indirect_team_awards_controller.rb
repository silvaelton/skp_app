class StoreIndirectTeamAwardsController < ApplicationController
  before_action :set_store
  before_action :set_context

  def new
    @indirect = @context.indirect_teams.new
  end

  def create
    @indirect = @context.indirect_teams.new(set_params)
    @indirect.save
  end

  def destroy
    @indirect = @context.indirect_teams.find(params[:id])
    @indirect.destroy
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_context
    @context = StoreContext.where(store_id: @store.id).find(params[:context_id])
  end


  def set_params
    params.require(:indirect_team_award).permit(:quantity, :value_staff, :percent)
  end
end
