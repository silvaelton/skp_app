class StoresController < ApplicationController
  before_action :set_store, only: [:edit, :update, :destroy, :show]
  
  def index
    @stores = Store.all
  end

  def new
    @store = StoreForm.new
  end

  def show
  end
  
  def create
    @store = StoreForm.new(set_params)

    if @store.save
      flash[:success] =  t :success
      redirect_to action: :index 
    else
      render action: :new
    end
  end

  def edit
  end

  def update

    if @store.update(set_params)
      flash[:success] =  t :success
      redirect_to action: :index 
    else
      render action: :edit
    end

  end

  def destroy
    @store.destroy 

    flash[:success] =  t :success
    
    redirect_to action: :index
  end

  private

  def set_params
    params.require(:store_form)
      .permit(:name, :cnpj, :telephone, :city, :uf, :cep, :address, :address_complement, :address_number, :neighborhood, :status)
  end

  def set_store
    @store = StoreForm.find(params[:id])
  end

  
end