class AddFriendsCountToInternationals < ActiveRecord::Migration[6.0]
  def change
    add_column :internationals, :friends_count, :integer, null: false, default: 0
  end
end
