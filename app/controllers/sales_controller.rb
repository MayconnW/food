class SalesController < ApplicationController
  
  before_action :set_sale, only: [:edit, :update, :destroy]
  
  def close_bill
    @sale = Sale.find(params[:id])
    @sale.status=1
    @sale.save!
    redirect_to "/admin/sale"
  end

  def new
    @sale = Sale.new
  end

  def edit
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.save
  end

  def update
    @sale.update(sale_params)
  end

  private
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:table, :customer_id, :waiter_id, :status, :total)
    end
  
end
