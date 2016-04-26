class Meme < ApplicationRecord
  validates :url, presence: true, uniqueness: true
end
