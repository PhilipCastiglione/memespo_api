class AddVotesToMeme < ActiveRecord::Migration[5.0]
  def change
    add_column :memes, :upvotes, :integer, default: 0
    add_column :memes, :downvotes, :integer, default: 0
  end
end
