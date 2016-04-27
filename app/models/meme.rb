class Meme < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  def votes
    upvotes - downvotes
  end
end
