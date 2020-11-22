# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_users = [
    {first_name: "Daniel", last_name: "Jamesone", email: "Danielseedadmin@test.com", password: "password"},
    {first_name: "Daniel", last_name: "Jamestwo", email: "Danielseed2@test.com", password: "password"},
    {first_name: "Daniel", last_name: "Jamesthree", email: "Danielseed3@test.com", password: "password"},
    {first_name: "Daniel", last_name: "Jamesfour", email: "Danielseed4@test.com", password: "password"},
    {first_name: "Daniel", last_name: "Jamesfive", email: "Danielseed5@test.com", password: "password"},
    {first_name: "Daniel", last_name: "Jamessix", email: "Danielseed6@test.com", password: "password"},
    {first_name: "Daniel", last_name: "Jamesseven", email: "Danielseed7@test.com", password: "password"},
    {first_name: "Daniel", last_name: "Jameseight", email: "Danielseed8@test.com", password: "password"},
    {first_name: "Daniel", last_name: "Jamesnine", email: "Danielseed9@test.com", password: "password"}
]

User.destroy_all
users = User.create!(test_users)
User.find_by_email("danielseedadmin@test.com").add_role(:admin)

ProgrammingLanguage.destroy_all
ruby = ProgrammingLanguage.create!({user_id: users[0].id, name: "Ruby", description: "Ruby is an interpreted, high-level, general-purpose programming language. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming."})
ruby.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/RUBY.png')), filename: 'RUBY.png')
ruby.save!

javascript = ProgrammingLanguage.create!({user_id: users[0].id, name: "Javascript", description: "JavaScript is a scripting language that is one of the three core languages used to develop websites."})
javascript.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Javascript.png')), filename: 'Javascript.png')
javascript.save!

python = ProgrammingLanguage.create!({user_id: users[0].id, name: "Python", description: "Python is an interpreted, object-oriented, high-level programming language with dynamic semantics."})
python.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/Python.png')), filename: 'Python.png')
python.save!

Listing.destroy_all
listing1 = Listing.create!({user_id: users[0].id, tutor_name: "Daniel Jamesone", tutor_email: "Danielseedadmin@test.com", title: "Ruby Tutor", description: "I am an experineced tutor with more than 10 years experience", price: 25.00, programming_language_id: ruby.id})

listing2 = Listing.create!({user_id: users[1].id, tutor_name: "Daniel Jamestwo", tutor_email: "Danielseed2@test.com", title: "Ruby Tutor", description: "I am an experineced tutor with more than 5 years experience", price: 35.00, programming_language_id: ruby.id})

listing3 = Listing.create!({user_id: users[2].id, tutor_name: "Daniel Jamesthree", tutor_email: "Danielseed3@test.com", title: "Ruby Tutor", description: "I am an experineced tutor with more than 6 years experience", price: 45.00, programming_language_id: ruby.id})

listing4 = Listing.create!({user_id: users[3].id, tutor_name: "Daniel Jamesfour", tutor_email: "Danielseed4@test.com", title: "Javascript Tutor", description: "I am an experineced tutor with more than 8 years experience", price: 20.00, programming_language_id: javascript.id})

listing5 = Listing.create!({user_id: users[4].id, tutor_name: "Daniel Jamesfive", tutor_email: "Danielseed5@test.com", title: "Javascript Tutor", description: "I am an experineced tutor with more than 7 years experience", price: 30.00, programming_language_id: javascript.id})

listing6 = Listing.create!({user_id: users[5].id, tutor_name: "Daniel Jamessix", tutor_email: "Danielseed6@test.com", title: "Javascript Tutor", description: "I am an experineced tutor with more than 6 years experience", price: 40.00, programming_language_id: javascript.id})

listing7 = Listing.create!({user_id: users[6].id, tutor_name: "Daniel Jamesseven", tutor_email: "Danielseed7@test.com", title: "Python Tutor", description: "I am an experineced tutor with more than 4 years experience", price: 50.00, programming_language_id: python.id})

listing8 = Listing.create!({user_id: users[7].id, tutor_name: "Daniel Jameseight", tutor_email: "Danielseed8@test.com", title: "Python Tutor", description: "I am an experineced tutor with more than 5 years experience", price: 40.00, programming_language_id: python.id})

listing9 = Listing.create!({user_id: users[8].id, tutor_name: "Daniel Jamesnine", tutor_email: "Danielseed9@test.com", title: "Python Tutor", description: "I am an experineced tutor with more than 6 years experience", price: 30.00, programming_language_id: python.id})

listing10 = Listing.create!({user_id: users[0].id, tutor_name: "Daniel Jamesone", tutor_email: "Danielseedadmin@test.com", title: "Javascript Tutor", description: "I am an experineced tutor with more than 10 years experience", price: 25.00, programming_language_id: javascript.id})

listing11 = Listing.create!({user_id: users[1].id, tutor_name: "Daniel Jamestwo", tutor_email: "Danielseed2@test.com", title: "Javascript Tutor", description: "I am an experineced tutor with more than 5 years experience", price: 35.00, programming_language_id: javascript.id})

listing12 = Listing.create!({user_id: users[2].id, tutor_name: "Daniel Jamesthree", tutor_email: "Danielseed3@test.com", title: "Javascript Tutor", description: "I am an experineced tutor with more than 6 years experience", price: 45.00, programming_language_id: javascript.id})

listing13 = Listing.create!({user_id: users[3].id, tutor_name: "Daniel Jamesfour", tutor_email: "Danielseed4@test.com", title: "Python Tutor", description: "I am an experineced tutor with more than 8 years experience", price: 20.00, programming_language_id: python.id})

listing14 = Listing.create!({user_id: users[4].id, tutor_name: "Daniel Jamesfive", tutor_email: "Danielseed5@test.com", title: "Python Tutor", description: "I am an experineced tutor with more than 7 years experience", price: 30.00, programming_language_id: python.id})

listing15 = Listing.create!({user_id: users[5].id, tutor_name: "Daniel Jamessix", tutor_email: "Danielseed6@test.com", title: "Python Tutor", description: "I am an experineced tutor with more than 6 years experience", price: 40.00, programming_language_id: python.id})

listing16 = Listing.create!({user_id: users[6].id, tutor_name: "Daniel Jamesseven", tutor_email: "Danielseed7@test.com", title: "Ruby Tutor", description: "I am an experineced tutor with more than 4 years experience", price: 50.00, programming_language_id: ruby.id})

listing17 = Listing.create!({user_id: users[7].id, tutor_name: "Daniel Jameseight", tutor_email: "Danielseed8@test.com", title: "Ruby Tutor", description: "I am an experineced tutor with more than 5 years experience", price: 40.00, programming_language_id: ruby.id})

listing18 = Listing.create!({user_id: users[8].id, tutor_name: "Daniel Jamesnine", tutor_email: "Danielseed9@test.com", title: "Ruby Tutor", description: "I am an experineced tutor with more than 6 years experience", price: 30.00, programming_language_id: ruby.id})



listing1.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar1.PNG')), filename: 'avatar1.PNG')
listing1.save!

listing10.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar1.PNG')), filename: 'avatar1.PNG')
listing10.save!

listing2.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar2.PNG')), filename: 'avatar2.PNG')
listing2.save!

listing11.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar2.PNG')), filename: 'avatar2.PNG')
listing11.save!

listing3.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar3.PNG')), filename: 'avatar3.PNG')
listing3.save!

listing12.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar3.PNG')), filename: 'avatar3.PNG')
listing12.save!

listing4.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar4.PNG')), filename: 'avatar4.PNG')
listing4.save!

listing13.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar4.PNG')), filename: 'avatar4.PNG')
listing13.save!

listing5.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar5.PNG')), filename: 'avatar5.PNG')
listing5.save!

listing14.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar5.PNG')), filename: 'avatar5.PNG')
listing14.save!

listing6.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar6.PNG')), filename: 'avatar6.PNG')
listing6.save!

listing15.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar6.PNG')), filename: 'avatar6.PNG')
listing15.save!

listing7.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar7.PNG')), filename: 'avatar7.PNG')
listing7.save!

listing16.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar7.PNG')), filename: 'avatar7.PNG')
listing16.save!

listing8.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar8.PNG')), filename: 'avatar8.PNG')
listing8.save!

listing17.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar8.PNG')), filename: 'avatar8.PNG')
listing17.save!

listing9.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar9.PNG')), filename: 'avatar9.PNG')
listing9.save!

listing18.picture.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar9.PNG')), filename: 'avatar9.PNG')
listing18.save!

puts "Users created: #{User.count}"