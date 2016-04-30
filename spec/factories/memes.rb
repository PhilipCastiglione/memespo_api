FactoryGirl.define do
  factory :meme do
    sequence(:url) {|n| "http://images.memes.com/meme/#{2000 + n}.jpg" }

    factory :meme_with_votes do
      upvotes { Faker::Number.between(0, 2000) }
      downvotes { Faker::Number.between(0, 2000) }
    end
  end
end
