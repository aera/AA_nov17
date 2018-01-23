PASSWORD = 'supersecret'

Answer.destroy_all
Question.destroy_all
User.destroy_all
Tag.destroy_all

super_user = User.create(
  first_name: 'Jon',
  last_name: 'Snow',
  email: 'js@winterfell.gov',
  password: PASSWORD,
  is_admin: true
)

10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

users = User.all

puts Cowsay.say("Created #{users.count} users", :tux)

['Arts', 'Sports', 'News', 'Cats', 'Cartoons', 'Lifestyle', 'Tech'].each do |tag_name|
  Tag.create(name: tag_name)
end

tag = Tag.all

100.times do
  Question.create(
    title: Faker::RickAndMorty.quote,
    body: Faker::HitchhikersGuideToTheGalaxy.quote,
    view_count: rand(1..1000),
    user: users.sample
  )
end

questions = Question.all

puts Cowsay.say("Created #{questions.count} questions", :ghostbusters)

questions.each do |question|
  rand(0..5).times.each do
    Answer.create(
      body: Faker::TheFreshPrinceOfBelAir.quote,
      question: question,
      user: users.sample
    )
  end
end




answers = Answer.all

puts Cowsay.say("Create #{answers.count} answers", :moose)

puts "Login as admin with #{super_user.email} and password of '#{PASSWORD}'!"






# bump
