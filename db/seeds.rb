puts "Purging all memes"
Meme.destroy_all

puts "Creating seed memes"
Meme.create!(url: "http://www.newslinq.com/wp-content/uploads/2014/06/ex-girlfriend-meme-14.jpg")
Meme.create!(url: "http://memesvault.com/wp-content/uploads/Funny-Workout-Meme-1.jpg")
Meme.create!(url: "http://memesvault.com/wp-content/uploads/Funny-Meme-8.jpg")
Meme.create!(url: "http://memesvault.com/wp-content/uploads/Funny-Meme-3.jpg")
Meme.create!(url: "http://memesvault.com/wp-content/uploads/Funny-Meme-13.jpg")
puts "#{Meme.count} memes created"
