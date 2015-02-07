require 'faker'

Item.delete_all
List.delete_all
User.delete_all

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'helloworld'
  )
  user.skip_confirmation!

  rand(3..10).times do
    list = user.lists.build(name: Faker::Lorem.words(rand(2..5)).join(' '))

    rand(3..10).times do
      item = list.items.build(name: Faker::Lorem.words(rand(3..7)).join(' '), completed: false)
      item.created_at = (rand*10).days.ago
    end
  end

  user.save
end

puts "#{User.count} users created."
puts "#{List.count} lists created."
puts "#{Item.count} items created."
