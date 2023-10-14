class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, unique: true
      t.integer :year
      t.string :plot
      t.string :country
      t.integer :running_time
      t.references :genre, null: false, foreign_key: true
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
