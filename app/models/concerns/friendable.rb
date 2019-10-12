module Friendable
  include ActiveSupport::Concern

  def friends_count
    friend_ids.count
  end

  def friends
    International.find(friend_ids)
  end

  def suggested_friends
    International.where.not(id: [id, *friend_ids])
  end

  private

  def friend_ids
    arel_table = Friendship.arel_table

    Friendship
      .where(
        [
          arel_table[:international_1_id].eq(id),
          arel_table[:international_2_id].eq(id),
        ].reduce(&:or)
      )
      .pluck(:international_1_id, :international_2_id)
      .flatten
      .uniq
      .-([id])
  end
end
