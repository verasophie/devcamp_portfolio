# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email:"test@test.com",
  password: "asdfgh",
  password_confirmation: "asdfgh",
  name: "admin dude",
  roles: "site_admin"
)

puts "1 admin user created"

User.create!(
  email:"test2@test.com",
  password: "asdfgh",
  password_confirmation: "asdfgh",
  name: "regular dude"
)

puts "1 regular user created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end
5.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: '„First off the Bike“ hieß es bei Vera mit der drittschnellsten Radzeit des Tages und von dieser Position ließ sie sich auch beim Laufen nicht mehr vertreiben und siegte verdient mit einer Zeit von 2:17:31 Stunden.',
    topic_id: Topic.last.id
    )
end

puts '5 blog posts created'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts '5 skills created'

6.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title #{portfolio_item}",
    subtitle: 'Ruby on Rails',
    body: 'Johanna und Melina beendeten den Triathlon ebenfalls in den Top 10 und sicherten somit den Kaifu Damen II hinter den starken Läuferinnen des TTS Tri Team den 2. Platz in der Tagesteamwertung.',
    main_image: 'http://placehold.it/600x400',
    thumb_image: 'http://placehold.it/350x200' 
  )
end

puts '6 portfolio items created'

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}",
    portfolio_id: Portfolio.last.id
  )
end

puts '3 technologies created'