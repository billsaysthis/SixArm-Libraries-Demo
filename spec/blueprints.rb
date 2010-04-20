require 'machinist/active_record'
require 'faker'

TITLES = ['manager','director','vp','engineer','designer','hr specialist']
DEPTS = ['HR','Engineering','Marketing','Sales','Executive']

Sham.define do
  first_name  { Faker::Name.first_name}
  middle_name  { Faker::Name.first_name}
  last_name  { Faker::Name.name }
  salary { 10000 * rand(50)}
  favorite_color {Colorful.choice}
  phone {Faker::PhoneNumber.phone_number}
  co_name {Faker::Company.name}
  dept_name {DEPTS.rand}
  city {Faker::Address.city}
  state {Faker::Address.us_state_abbr}
  title {TITLES.rand}
end

Company.blueprint do
  name {Sham.co_name}
  city {Sham.city}
  state {Sham.state}
  incorporation_year  { make_inc_year() }
end

Department.blueprint do
  company
  name {Sham.dept_name}
  manager {Person.make(:manager)}
end

Title.blueprint do
  title {Sham.title}
end

Person.blueprint do
  first_name {Sham.first_name}
  middle_name {Sham.middle_name}
  last_name {Sham.last_name}
  salary {Sham.salary}
  favorite_color {Sham.favorite_color}
  phone {Sham.phone}
  hired_on {DateTime.civil(y=2005,m=rand(12),d=rand(28))}
  title # belongs_to association
  department
  company
end

Person.blueprint(:manager) do
  title_id = 3
end

def make_inc_year
  arr = [1850..2009]
  arr[rand(a.size)].to_s
end