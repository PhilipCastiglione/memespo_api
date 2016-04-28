require 'rails_helper'

RSpec.describe Meme, :type => :model do
  before :each do
    @meme = Meme.new(url: "http://static.tumblr.com/ponuofb/E2Fm3kwyo/623573278216.jpg")
  end

  it "is valid with a url" do
    expect(@meme).to be_valid
  end

  it "is invalid with a duplicate url" do
    dup_meme = Meme.create(url: "http://static.tumblr.com/ponuofb/E2Fm3kwyo/623573278216.jpg")
    @meme.valid?
    expect(@meme.errors[:url]).to include("has already been taken")
    dup_meme.destroy
  end

  it "is created with 0 upvotes" do
    expect(@meme.upvotes).to eq 0
  end

  it "is created with 0 downvotes" do
    expect(@meme.downvotes).to eq 0
  end

  it "calculates and returns the net votes as an integer" do
    expect(@meme.votes).to eq 0

    @meme.upvotes = 5
    @meme.downvotes = 3
    expect(@meme.votes).to eq 2
  end
end
