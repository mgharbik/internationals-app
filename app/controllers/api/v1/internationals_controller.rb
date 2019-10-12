class Api::V1::InternationalsController < ApplicationController
  def index
    @internationals = International.all.order(created_at: :desc)
  end
end
