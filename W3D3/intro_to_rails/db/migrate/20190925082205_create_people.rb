class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :house_id
    end

    add_index :people, :name 
    add_index :people, :house_id
  end
end
