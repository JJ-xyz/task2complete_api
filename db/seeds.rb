# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Task.delete_all

10.times do |i|
  user_passcode = Faker::Name.first_name
  User.create(
    username: user_passcode,
    password: user_passcode,
    email: Faker::Internet.free_email(user_passcode),
    e_confirmed: Faker::Boolean.boolean
  )
end

10.times do |i|
  Task.create(
    name: Faker::App.name,
    description: Faker::Hacker.say_something_smart + Faker::Hacker.say_something_smart,
    date_assigned: Faker::Date.backward(14),
    date_due: Faker::Date.forward(23),
    date_completed: "",
    assigned_to: Faker::Number.between(1, 10),
    assigned_by: Faker::Number.between(1, 10),
    is_complete: Faker::Boolean.boolean
    )
end
