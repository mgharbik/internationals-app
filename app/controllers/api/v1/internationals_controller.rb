class Api::V1::InternationalsController < ApplicationController
  before_action :set_international, only: %i[show]

  def index
    @internationals = International.all.order(created_at: :desc)
  end

  def create
    @international = International.new(international_params)

    if @international.save
      render :show, status: :created
    else
      render json: @international.errors, status: :unprocessable_entity
    end
  end

  private

  def set_international
    @international = International.friendly.find(params[:id])
  end

  def international_params
    params.require(:international).permit(:name, :country)
  end
end
