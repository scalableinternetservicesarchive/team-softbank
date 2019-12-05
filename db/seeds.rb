# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
posts = []
comments = []

# create 25 users, each with 25 posts
25.times do
  u = User.create!(
    email: Faker::Internet.unique.email,
    password: '123456'
  )
  users.push(u.id)

  25.times do
    p = Post.create!(
      user_id: u.id,
      title: Faker::TvShows::SiliconValley.quote,
      body: Faker::Hipster.paragraph(sentence_count: 5),
      lonlat: "POINT(#{rand(-118.55..-118.08)} #{rand(33.69..34.12)})"
    )
    posts.push(p.id)
  end
end

# create 1250 random comments across all posts
1250.times do
  c = Comment.create!(
    user_id: users.sample,
    post_id: posts.sample,
    body: Faker::Lorem.sentence(word_count: 8)
  )
  comments.push(c.id)
end

# create 2500 random likes across posts and comments
2500.times do
  type = [0, 1].sample
  id = [posts, comments][type].sample
  Like.create!(
    user_id: users.sample,
    like_type: type,
    type_id: id
  )
  r = type == 0 ? Post.find(id) : Comment.find(id)
  r.like_count += 1
  r.save!
end
