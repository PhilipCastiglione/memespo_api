require 'rails_helper'

RSpec.describe Meme, :type => :model do
  it "is valid with a url" do
    meme = Meme.new(url: "http://static.tumblr.com/ponuofb/E2Fm3kwyo/623573278216.jpg")
    expect(meme).to be_valid
  end

  it "is invalid with a duplicate url" do
    Meme.create(url: "http://static.tumblr.com/ponuofb/E2Fm3kwyo/623573278216.jpg")
    meme = Meme.new(url: "http://static.tumblr.com/ponuofb/E2Fm3kwyo/623573278216.jpg")
    meme.valid?
    expect(meme.errors[:url]).to include("has already been taken")
  end

  it "is created with 0 upvotes" do
    meme = Meme.new
    expect(meme.upvotes).to eq 0
  end

  it "is created with 0 downvotes" do
    meme = Meme.new
    expect(meme.downvotes).to eq 0
  end

  it "calculates and returns the net votes as an integer" do
    meme = Meme.new
    expect(meme.votes).to eq 0

    meme.upvotes = 5
    meme.downvotes = 3
    expect(meme.votes).to eq 2
  end
end
