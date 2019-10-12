class CreateInternationals < ActiveRecord::Migration[6.0]
  def change
    create_table :internationals do |t|
      t.string :name, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
