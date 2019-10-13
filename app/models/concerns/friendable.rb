module Friendable
  extend ActiveSupport::Concern

  def friends
    International
      .joins("
        LEFT JOIN friendships
          ON friendships.international_1_id = internationals.id
        WHERE friendships.international_2_id = #{id}")
      .union(
        International
          .joins("
            LEFT JOIN friendships
              ON friendships.international_2_id = internationals.id
            WHERE friendships.international_1_id = #{id}")
      )
  end

  def suggested_friends
    International.where.not(id: [id, *friends.ids])
  end
end
