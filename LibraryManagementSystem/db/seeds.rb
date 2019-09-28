# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Usertype.create(:usertype => 'admin')
Usertype.create(:usertype => 'librarian')
Usertype.create(:usertype => 'studentG')
Usertype.create(:usertype => 'studentUG')
Usertype.create(:usertype => 'studentPhD')

User.create(:email => 'admin@lms.com', :password => 'password', :usertype => "admin", :name => 'Admin')
