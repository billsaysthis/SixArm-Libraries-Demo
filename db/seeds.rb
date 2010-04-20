# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create!(:name => 'Daley', :city => cities.first)

# Titles
ceo = Title.create!({:title => 'CEO'})
vp = Title.create!({:title => 'Vice President'})
dir = Title.create!({:title => 'Director'})
mgr = Title.create!({:title => 'Manager'})
sreng = Title.create!({:title => 'Sr. Engineer'})
eng = Title.create!({:title => 'Engineer'})

# Companies
# corp = Company.create!([{:name => '', :city => '', :state => '', :incorporation_year => ''}])
corp = Company.create!({:name => 'BiggerStuff, Inc.', :city => 'Mountain View', :state => 'CA', :incorporation_year => '1997'})

# Departments
# dept = Department.create!([:name => '', :company => corp})
dept_exec = Department.create!({:name => 'HQ', :company => corp})
dept_hr = Department.create!({:name => 'HR', :company => corp})
dept_eng = Department.create!({:name => 'Engineering', :company => corp})
dept_mktg = Department.create!({:name => 'Marketing', :company => corp})
dept_sales = Department.create!({:name => 'Sales', :company => corp})

# People
ps1 = Person.create!({:first_name => 'Jennifer', :middle_name => 'Alice', :last_name => 'Chan', :department => dept_exec, :company => corp, :title_id => ceo.id, :phone => '650-555-1001', :salary => 500000, :hired_on => DateTime.civil(y=2001,m=9,d=12), :favorite_color => Colorful.choice})
ps2 = Person.create!({:first_name => 'Bran', :middle_name => 'B', :last_name => 'Werder', :department => dept_sales, :company => corp, :title_id => vp.id, :phone => '650-555-1002', :salary => 400000, :hired_on => DateTime.civil(y=2002,m=9,d=12), :favorite_color => Colorful.choice})
ps3 = Person.create!({:first_name => 'T', :middle_name => 'S', :last_name => 'Singh', :department => dept_mktg, :company => corp, :title_id => vp.id, :phone => '650-555-1003', :salary => 300000, :hired_on => DateTime.civil(y=2003,m=9,d=12), :favorite_color => Colorful.choice})
ps4 = Person.create!({:first_name => 'Michael', :middle_name => 'J', :last_name => 'Thomas', :department => dept_eng, :company => corp, :title_id => dir.id, :phone => '650-555-1004', :salary => 300000, :hired_on => DateTime.civil(y=2003,m=9,d=12), :favorite_color => Colorful.choice})
ps5 = Person.create!({:first_name => 'Sara', :middle_name => 'W', :last_name => 'White', :department => dept_hr, :company => corp, :title_id => dir.id, :phone => '650-555-1005', :salary => 120000, :hired_on => DateTime.civil(y=2004,m=9,d=12), :favorite_color => Colorful.choice})
ps6 = Person.create!({:first_name => 'Joanne', :middle_name => 'F', :last_name => 'Stein', :department => dept_eng, :company => corp, :title_id => sreng.id, :phone => '650-555-1006', :salary => 150000, :hired_on => DateTime.civil(y=2004,m=9,d=12), :favorite_color => Colorful.choice})
ps7 = Person.create!({:first_name => 'Aston', :middle_name => 'R', :last_name => 'Lerner', :department => dept_eng, :company => corp, :title_id => sreng.id, :phone => '650-555-1007', :salary => 150000, :hired_on => DateTime.civil(y=2001,m=9,d=12), :favorite_color => Colorful.choice})
ps8 = Person.create!({:first_name => 'Prianna', :middle_name => 'P', :last_name => 'Al Jamman', :department => dept_eng, :company => corp, :title_id => eng.id, :phone => '650-555-1008', :salary => 120000, :hired_on => DateTime.civil(y=2007,m=9,d=12), :favorite_color => Colorful.choice})
ps9 = Person.create!({:first_name => 'Rosalind', :middle_name => 'R', :last_name => 'Chao', :department => dept_eng, :company => corp, :title_id => eng.id, :phone => '650-555-1009', :salary => 120000, :hired_on => DateTime.civil(y=2008,m=9,d=12), :favorite_color => Colorful.choice})
ps10 = Person.create!({:first_name => 'Art', :middle_name => 'S', :last_name => 'Frommer', :department => dept_eng, :company => corp, :title_id => eng.id, :phone => '650-555-1010', :salary => 120000, :hired_on => DateTime.civil(y=2008,m=9,d=12), :favorite_color => Colorful.choice})

# Managers
dept_exec.manager_id = ps1.id
dept_exec.save!
dept_hr.manager_id = ps5.id
dept_hr.save!
dept_eng.manager_id = ps4.id
dept_eng.save!
dept_mktg.manager_id = ps3.id
dept_mktg.save!
dept_sales.manager_id = ps2.id
dept_sales.save!