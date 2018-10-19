class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.string :name
      t.string :grape
      t.integer :year
      t.string :location
      t.integer :user_id
    end
  end
end
