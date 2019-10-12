class AddSlugToInternationals < ActiveRecord::Migration[6.0]
  def change
    add_column :internationals, :slug, :string
    add_index :internationals, :slug, unique: true
  end
end
