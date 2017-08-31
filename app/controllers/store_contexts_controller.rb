class StoreContextsController < ApplicationController
  before_action :set_store
  before_action :set_context, only: [:edit, :show, :update, :destroy]

  def new
    @context = StoreContextForm.where(store_id: @store.id).new
  end

  def create
    @context = StoreContextForm.where(store_id: @store.id).new(set_params)
    @context.save
  end

  def show
  end

  def edit
  end

  def update
    @context.update(set_params)
  end

  def destroy
    @context.destroy
  end


  private

  def set_context
    @context = StoreContextForm.where(store_id: @store.id).find(params[:id])
  end

  def set_params
    params.require(:store_context_form)
      .permit(:title, :description, :started_at, :ended_at, :status, :manager_ids)
  end

  def set_store
    @store = Store.find(params[:store_id])
  end
  
end