class Api::V1::InternationalsController < ApplicationController
  before_action :set_international, only: %i[show]

  def index
    @internationals = International.all.order(created_at: :desc)
  end

  private

  def set_international
    @international = International.friendly.find(params[:id])
  end
end
