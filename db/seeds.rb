# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Task.delete_all
User.create(
  username: "Luigi",
  password: "pass",
  email: "luigi@nintendo.net",
  e_confirmed: false
)
User.create(
  username: "Mario",
  password: "pass",
  email: "mario@nintendo.net",
  e_confirmed: false
)
User.create(
  username: "Yoshi",
  password: "pass",
  email: "yoshi@nintendo.net",
  e_confirmed: false
)
User.create(
  username: "Toad",
  password: "pass",
  email: "toad@nintendo.net",
  e_confirmed: false
)
User.create(
  username: "Princes",
  password: "pass",
  email: "princes@nintendo.net",
  e_confirmed: false
)

Task.create(
  name: "Network Installation and Setup",
  description: "Supervise cabling the building.  Perform network equipment installation and setup. Connecting dual fiber optics to external facilities.  Confirm functionality of the satellite backup line.",
  date_assigned: "2017-01-02",
  date_due: "2017-03-30",
  date_completed: "",
  assigned_to: 3,
  assigned_by: 2,
  is_complete: false
  )
Task.create(
  name: "250 Virtual Servers Network",
  description: "Perform the installation and configuration of the private cloud. Prepare the development environement first and notify our development team as soon as it is available.",
  date_assigned: "2016-11-30",
  date_due: "2017-02-27",
  date_completed: "",
  assigned_to: 1,
  assigned_by: 2,
  is_complete: true
  )
  Task.create(
    name: "Developemnt Team Recruitment",
    description: "Interview and recruit the software development team.  Pay atention the to new fullstack group coming out of GA",
    date_assigned: "2016-12-10",
    date_due: "2017-01-10",
    date_completed: "",
    assigned_to: 3,
    assigned_by: 5,
    is_complete: false
    )




# --- to create test data using Faker ---BEGIN
# User.delete_all
# Task.delete_all
#
# 10.times do |i|
#   user_passcode = Faker::Name.first_name
#   User.create(
#     username: user_passcode,
#     password: user_passcode,
#     email: Faker::Internet.free_email(user_passcode),
#     e_confirmed: Faker::Boolean.boolean
#   )
# end
#
# 10.times do |i|
#   Task.create(
#     name: Faker::App.name,
#     description: Faker::Hacker.say_something_smart + Faker::Hacker.say_something_smart,
#     date_assigned: Faker::Date.backward(14),
#     date_due: Faker::Date.forward(23),
#     date_completed: "",
#     assigned_to: Faker::Number.between(1, 10),
#     assigned_by: Faker::Number.between(1, 10),
#     is_complete: Faker::Boolean.boolean
#     )
# end
# --- to create test data using Faker ---END
