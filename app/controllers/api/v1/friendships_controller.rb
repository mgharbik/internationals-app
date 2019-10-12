class Api::V1::FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      head :created
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:international_1_id, :international_2_id)
  end
end
