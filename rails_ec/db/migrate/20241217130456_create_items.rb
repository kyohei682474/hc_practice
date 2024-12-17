class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.demical :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
