# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

attr = { email: 'admin@local.admin' }
user = User.find_by(attr)
if (user.blank?)
  user = User.new(attr)
  user.password = '123456'
  user.first_name = 'Admin'
  user.last_name = 'Admin'
  user.confirmed_at = Time.now if user.respond_to?(:confirmed_at)
  user.save!
  puts "Created user #{user.email}" if user.persisted?
else
  puts "User #{user.email} already exists"
end
