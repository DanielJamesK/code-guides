# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_users = [
    {first_name: "Daniel", last_name: "James", email: "Danielseed2@test.com", password: "password"}
]


User.destroy_all
users = User.create!(test_users)
User.find_by_email("danielseed2@test.com").add_role(:admin)

ProgrammingLanguage.destroy_all
ruby = ProgrammingLanguage.create!({user_id: users[0].id, name: "Ruby", description: "Ruby is an interpreted, high-level, general-purpose programming language. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming."})
ruby.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/RUBY.png')), filename: 'defaultimage1.png')
ruby.save!
javascript = ProgrammingLanguage.create!({user_id: users[0].id, name: "Javascript", description: "JavaScript is a scripting language that is one of the three core languages used to develop websites."})

Listing.destroy_all
listing1 = Listing.create!({user_id: users[0].id, tutor_name: "Daniel K", tutor_email: "Danielseed@test.com", title: "Ruby Tutor", description: "I am an experineced tutor with more than 10 years experience", price: 25.00, programming_language_id: ruby.id})

listing1.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/defaultimage1.png')), filename: 'defaultimage1.png')
listing1.save!
puts "Users created: #{User.count}"