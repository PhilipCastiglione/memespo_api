FactoryGirl.define do
  factory :meme do
    sequence(:url) {|n| "http://images.memes.com/meme/#{2000 + n}.jpg"}
    upvotes 0
    downvotes 0
  end
end
