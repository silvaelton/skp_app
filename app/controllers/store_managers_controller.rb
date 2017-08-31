class StoreManagersController < ApplicationController
  before_action :set_store
  before_action :set_staff, only: [:edit, :update, :destroy]

  def new
    @staff = StoreStaffForm.where(store_id: @store.id, job: 'gerente').new
  end

  def create
    @staff = StoreStaffForm.where(store_id: @store.id, job: 'gerente').new(set_params)
    @staff.save
  end

  def edit
  end

  def update
    @staff.update(set_params)
  end

  def destroy
    @staff.destroy
  end

  private

  def set_staff 
    @staff = StoreStaffForm.where(store_id: @store.id, job: 'gerente').find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_params
    params.require(:store_staff_form)
      .permit(:name,:cpf)
  end
  
end
