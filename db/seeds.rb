# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

role = Role.create_with(name: 'Administrador geral').find_or_create_by!(identifier: :manager)
Role.create_with(name: 'Administrador assistente').find_or_create_by!(identifier: :assistant)

User.create_with(name: 'Adminstrador', register_number: '000001', cpf: CPF.generate(true),
                 password: '123456', role_id: role.id)
    .find_or_create_by!(username: 'admin', email: 'admin@utfpr.edu.br')

100.times do |i|

    Department.create!(name: Faker::Name.unique.name, description: Faker::Name.name, initials: Faker::Name.name,
                    local: Faker::Number.number(digits: 2), phone: "(42) 3623-9972", email: Faker::Internet.email)
end