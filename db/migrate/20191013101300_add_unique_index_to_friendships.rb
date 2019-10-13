class AddUniqueIndexToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_index :friendships, [:international_1_id, :international_2_id], unique: true
  end
end
