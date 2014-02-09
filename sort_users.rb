require './user.rb'
require './sorters.rb'
require 'faker' # from Gemfile

# setup some users using faker

def generate_random_login(length = 6)
  (('a'..'z').to_a + (0..9).to_a).sample(length).join
end

def print_user_list(user_list)
  puts "     \tfirst name\tlast name\tlogin"
  user_list.each_with_index do |user, idx|
    puts "#{idx}\t#{user.firstname}\t#{user.lastname}\t#{user.login}"
  end

end

user_list = 10.times.map do
  # create a dummy user
  User.new(Faker::Name.first_name, Faker::Name.last_name, generate_random_login)
end

# show me the users before they are sorted
print_user_list(user_list)

# sort the list by first name
puts "Sort by last name"

print_user_list(user_list.sort(&Sorters.by_lastname))

puts "Sort by first name"
print_user_list(user_list.sort(&Sorters.by_firstname))

# Generate data where there are duplicate last names
last_names = 2.times.map { Faker::Name.last_name }
first_names = 5.times.map { Faker::Name.last_name }

user_list = 10.times.map do |idx|
  # create a dummy user
  User.new(first_names.sample, last_names.sample, generate_random_login)
end

puts "By last name then first name" 
print_user_list(user_list.sort(&Sorters.by_lastname_then_firstname))
