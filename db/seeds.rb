puts "Purging all memes"
Meme.destroy_all

puts "Creating seed memes"
Meme.create!(url: "http://www.newslinq.com/wp-content/uploads/2014/06/ex-girlfriend-meme-14.jpg", upvotes: 6, downvotes: 2)
Meme.create!(url: "http://memesvault.com/wp-content/uploads/Funny-Workout-Meme-1.jpg", upvotes: 1, downvotes: 2)
Meme.create!(url: "http://memesvault.com/wp-content/uploads/Funny-Meme-8.jpg", upvotes: 5, downvotes: 9)
Meme.create!(url: "http://memesvault.com/wp-content/uploads/Funny-Meme-3.jpg", upvotes: 9, downvotes: 7)
Meme.create!(url: "http://memesvault.com/wp-content/uploads/Funny-Meme-13.jpg", upvotes: 12, downvotes: 2)
puts "#{Meme.count} memes created"
