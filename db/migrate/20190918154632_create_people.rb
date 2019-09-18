class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :last_name, limit: 50, null: false
      t.string :first_name, limit: 50, null: false
      t.string :gender, limit: 10, null: false

      t.timestamps
    end
  end
end
