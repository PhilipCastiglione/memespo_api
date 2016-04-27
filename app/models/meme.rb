class Meme < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  def votes
    upvotes - downvotes
  end

  def upvote
    self.update(upvotes: upvotes + 1)
  end

  def downvote
    self.update(downvotes: downvotes + 1)
  end
end
