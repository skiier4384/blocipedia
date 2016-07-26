 require 'random_data'
 
 # Create Users
 5.times do
  User.create!(
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all
 
 user = User.first
 user.update_attributes!(
   email: 'youremail.com', # replace this with your personal email
   password: 'helloworld'
 )
 
 # Create Admin
  admin = User.create!(
    username: RandomData.random_name,
    email: RandomData.random_email,,
    password: RandomData.random_sentence,
    role: 'admin'
)

 # Create Wikis
 50.times do
     
   Wiki.create!(
     user:   users.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 wikis = Wiki.all
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"