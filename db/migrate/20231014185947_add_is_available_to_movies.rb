class AddIsAvailableToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :is_available, :integer
  end
end
