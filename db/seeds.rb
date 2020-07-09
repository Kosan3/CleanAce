# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: 't@t') do |user|
  user.last_name = 'admin'
  user.first_name ='admin'
  user.kana_last_name = 'アドミン'
  user.kana_first_name = 'アドミン'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.postal_code = '348-0021'
  user.address = '埼玉県羽生市下新郷1-1'
  user.phone_number = '0485633634'
  user.admin = true
end

Type.create! do |type|
  type.type_name = 'グランドコート'
end

