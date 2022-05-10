# frozen_string_literal: true

#
# Stocks Controller
#
class StocksController < ApplicationController
  before_action :set_stock, only: %i[show update destroy]
  def index
    @stocks = Stock.all
    render json: @stocks, each_serializer: StockSerializer
  end

  def create
    @stock = Stock.create(stock_params)
    render json: @stock, serializer: StockSerializer
  end

  def update
    @stock.update(stock_params)
    render json: @stock, serializer: StockSerializer
  end

  def destroy
    @stock.destroy
    render json: @stock, serializer: StockSerializer
  end

  protected

  def stock_params
    params.require(:stock).permit(:id, :name, bearer_attributes: [:name])
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
