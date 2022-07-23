Post.destroy_all
Comment.destroy_all


# PASSWORD = "123"
# super_user = User.create(
#   first_name: "Admin",
#   last_name: "User",
#   email: "admin@user.com",
#   password: PASSWORD,
#   is_admin: true
# )
RANDOM_100_CHARS = "hello world hello world hello world hello world hello world hello world hello world hello hello worl hello world hello world"


20.times do
  p = Post.create(
    title: Faker::Hacker.say_something_smart,
    body: Faker::ChuckNorris.fact + "#{RANDOM_100_CHARS}",

  )
  if p.valid?
    rand(1..5).times do
      Comment.create(body: Faker::Hacker.say_something_smart, post:p)
    end
  end
end





posts = Post.all
comments = Comment.all


puts Cowsay.say("Generated #{posts.count} posts", :frogs)
puts Cowsay.say("Generated #{comments.count} comments", :dragon)
