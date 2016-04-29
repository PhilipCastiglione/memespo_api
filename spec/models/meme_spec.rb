require 'rails_helper'

RSpec.describe Meme, :type => :model do
  before :each do
    @meme = FactoryGirl.build(:meme)
  end
  
  it "has a valid factory" do
    expect(@meme).to be_valid
  end

  it "is invalid without a url" do
    @meme.url = nil
    expect(@meme).to_not be_valid
  end

  it "is invalid with a duplicate url" do
    FactoryGirl.create(:meme, url: @meme.url)
    @meme.valid?
    expect(@meme.errors[:url]).to include("has already been taken")
  end

  it "is created with 0 upvotes" do
    expect(@meme.upvotes).to eq 0
  end

  it "is created with 0 downvotes" do
    expect(@meme.downvotes).to eq 0
  end

  it "calculates and returns net votes as an integer" do
    expect(@meme.votes).to eq 0

    @meme.upvotes = 5
    @meme.downvotes = 3
    expect(@meme.votes).to eq 2
  end
end
