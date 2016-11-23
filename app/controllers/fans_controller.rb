class FansController < ApplicationController
  def index
    @fans = Fan.page(params[:page]).per(10)
  end

  def show
    @fan = Fan.find(params[:id])
  end
end
