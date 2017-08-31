class StoreContextsController < ApplicationController
  before_action :set_store

  def new
    @context = StoreContextForm.where(store_id: @store.id).new
  end

  def create
    @context = StoreContextForm.where(store_id: @store.id).new(set_params)
    @context.save
  end

  def show
    @context = StoreContextForm.where(store_id: @store.id).find(params[:id])
  end

  def destroy
    @context = StoreContextForm.where(store_id: @store.id).find(params[:id])
    @context.destroy
  end


  private

  def set_params
    params.require(:store_context_form)
      .permit(:title, :description, :started_at, :ended_at, :status, :manager_ids)
  end

  def set_store
    @store = Store.find(params[:store_id])
  end
  
end