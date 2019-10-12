class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :international_1
      t.belongs_to :international_2

      t.timestamps
    end
  end
end
