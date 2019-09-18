class CreateAliases < ActiveRecord::Migration[5.2]
  def change
    create_table :aliases do |t|
      t.string :name, limit: 50, null: false
      t.belongs_to :person, foreign_key: true

      t.timestamps
    end
  end
end
