class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :director
  enum is_available: { 'Em breve': 1, 'Nos cinemas': 2 }
  has_one_attached :poster
end
