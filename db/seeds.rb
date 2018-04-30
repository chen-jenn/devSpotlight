# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = 'password'

Technology.destroy_all
TechStack.destroy_all
User.destroy_all
Event.destroy_all
Announcement.destroy_all
Organization.destroy_all

20.times do
  o = Organization.create(
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    employee_count: rand(5..30),
    tech_team_size: rand(1..5),
    address: "142 West Hastings Avenue, Vancouver, BC, Canada",
    website_url: Faker::Internet.url('example.com'),
    twitter: Faker::Twitter.screen_name,
    published: [true, false].sample
  )
end

organizations = Organization.all

10.times do
  Technology.create(name: Faker::Book.genre)
end

technologies = Technology.all

super_user = User.create(
  first_name: "Jon",
  last_name: "Snow",
  email: "js@winterfell.gov",
  approved: true,
  permission_type: 3,
  password: PASSWORD,
  password_confirmation: PASSWORD,
  organization_id: organizations.sample.id
)

10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    approved: true,
    permission_type: [1,2].sample,
    password: PASSWORD,
    password_confirmation: PASSWORD,
    organization_id: organizations.sample.id
  )
end

users = User.all

50.times do
  Event.create(
    event_name: Faker::StarTrek.villain,
    date: Faker::Date.forward(23),
    event_url: Faker::Internet.url('example.com'),
    organization: organizations.sample
  )
end

events = Event.all

50.times do
  Announcement.create(
    article_name: Faker::Movie.quote,
    article_url: Faker::Internet.url('example.com'),
    organization: organizations.sample
  )
end

announcements = Announcement.all

  # Organization.shuffle[0..rand(technologies.count)].each do |t|
  #   TechStack.create(technology_id: t, organization_id: o)


puts "Created a #{organizations.count} organizations"
puts "Created #{users.count} users"
puts "Created a #{events.count} events"
puts "Created a #{technologies.count} technologies"
puts "Created a #{announcements.count} announcements"
puts "Login with #{super_user.email} and password of '#{PASSWORD}'"
