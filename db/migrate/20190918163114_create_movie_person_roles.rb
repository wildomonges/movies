class CreateMoviePersonRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_person_roles do |t|
      t.belongs_to :movie, foreign_key: true
      t.belongs_to :person, foreign_key: true
      t.string :role, null: false

      t.timestamps
    end
  end
end
