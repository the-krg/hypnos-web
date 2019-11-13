# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create default user

user = User.create(username: 'default',
                   password: '123',
                   height: 170,
                   weight: 80,
                   scholarity: 'SUPC',
                   transportation: 'Bus',
                   smoker: false,
                   take_meds: false)

# Create random nights for user

(1..7).each do |n_day|
  user.nights.create(sleep_hour: Date.today.end_of_day - rand(0..4).hours - n_day.days,
                     wake_hour: Date.today.beginning_of_day + rand(6..10).hours - n_day.days + 1.day,
                     quality: rand(1..5),
                     ill: rand(0..1),
                     dream: rand(0..1),
                     created_at: Date.today.beginning_of_day - n_day.days + 1.day)
end

# Create random days for user

(1..7).each do |n_day|
  user.days.create(quality: rand(1..5),
                   different: rand(0..1),
                   exercised: rand(0..1),
                   ill: rand(0..1),
                   created_at: Date.today.end_of_day - n_day.days + 1.day)
end