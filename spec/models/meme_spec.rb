require 'rails_helper'

RSpec.describe Meme, :type => :model do
  before :each do
    @meme = build(:meme)
    @meme_with_votes = build(:meme_with_votes)
  end
  
  it "has a valid factory" do
    expect(@meme).to be_valid
  end

  it "is invalid without a url" do
    @meme.url = nil
    expect(@meme).to_not be_valid
  end

  it "is invalid with a duplicate url" do
    create(:meme, url: @meme.url)
    @meme.valid?
    expect(@meme.errors[:url]).to include("has already been taken")
  end

  it "is created with 0 upvotes" do
    expect(@meme.upvotes).to eq(0)
  end

  it "is created with 0 downvotes" do
    expect(@meme.downvotes).to eq(0)
  end

  it "calculates and returns net votes as an integer" do
    votes = @meme_with_votes.upvotes - @meme_with_votes.downvotes
    expect(@meme_with_votes.votes).to eq(votes)
  end

  it "increments upvotes when requested" do
    votes = @meme_with_votes.upvotes
    @meme_with_votes.upvote
    expect(@meme_with_votes.upvotes).to eq(votes + 1)
  end

  it "increments downvotes when requested" do
    votes = @meme_with_votes.downvotes
    @meme_with_votes.downvote
    expect(@meme_with_votes.downvotes).to eq(votes + 1)
  end
end
