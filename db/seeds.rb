Post.destroy_all
Comment.destroy_all
User.destroy_all

PASSWORD = "123"
super_user = User.create(
  name: "adminUser",
  email: "admin@user.com",
  password: PASSWORD,
  is_admin: true
)
RANDOM_100_CHARS = "hello world hello world hello world hello world hello world hello world hello world hello hello worl hello world hello world"

10.times do
  name = Faker::Name.name
  User.create(
    name: name,
    email: "#{name}@gmail.com",
    password: PASSWORD
  )
end
users = User.all

20.times do
  p = Post.create(
    title: Faker::Hacker.say_something_smart,
    body: Faker::ChuckNorris.fact + "#{RANDOM_100_CHARS}",
    user: users.sample
  )
  if p.valid?
    rand(1..5).times do
      Comment.create(body: Faker::Hacker.say_something_smart, post:p, user: users.sample)
    end
  end
end





posts = Post.all
comments = Comment.all


# puts Cowsay.say("Generated #{posts.count} posts", :frogs)
# puts Cowsay.say("Generated #{comments.count} comments", :dragon)
# puts Cowsay.say("Generated #{users.count} users", :frogs)

p "created #{posts.count} posts, #{comments.count} comments, #{users.count} users"
