class Api::V1::InternationalsController < ApplicationController
  before_action :set_international, only: :show

  def index
    @internationals = International.ordered
  end

  def create
    @international = International.new(international_params)

    if @international.save
      render json: { slug: @international.slug }, status: :created
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
