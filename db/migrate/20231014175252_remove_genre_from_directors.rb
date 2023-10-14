class RemoveGenreFromDirectors < ActiveRecord::Migration[7.0]
  def change
    remove_reference :directors, :genre, foreign_key: true
  end
end
