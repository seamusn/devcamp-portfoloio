# frozen_string_literal: true

class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(
      params.require(:portfolio).permit(:title, :subtitle, :body)
    )

    respond_to do |format|
      if @portfolio_item.save
        format.html do
          redirect_to portfolios_path, notice: 'Your portfolio item is now live'
        end
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(
        params.require(:portfolio).permit(:title, :subtitle, :body)
      )
        format.html do
          redirect_to portfolios_path,
                      notice: 'The record successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    # destroy/delete the record
    @portfolio_item.destroy

    # redirect
    respond_to do |format|
      format.html {
        redirect_to portfolios_path, notice: 'Portfolio was removed.'
      }
    end
  end
end
