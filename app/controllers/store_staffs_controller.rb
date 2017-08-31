class StoreStaffsController < ApplicationController
  before_action :set_store

  def new
    @staff = StoreStaffForm.where(store_id: @store.id, job: 'vendedor').new
  end

  def create
    @staff = StoreStaffForm.where(store_id: @store.id, job: 'vendedor').new(set_params)
    @staff.save
  end

  def destroy
    @staff = StoreStaffForm.where(store_id: @store.id, job: 'vendedor').find(params[:id])
    @staff.destroy
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_params
    params.require(:store_staff_form)
      .permit(:name,:cpf)
  end
  
end
