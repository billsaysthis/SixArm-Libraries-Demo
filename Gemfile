# Edit this Gemfile to bundle your application's dependencies.
source 'http://gemcutter.org'


gem "rails", :path => '~/Sites/rails'

# ActiveRecord requires a database adapter. By default,
# Rails has selected sqlite3.
gem "sqlite3-ruby", :require => "sqlite3"
gem "show_for"
gem "hirb"
# gem "meta_search"

## Sixarm gems:
gem "sixarm_ruby_colorful"
gem "sixarm_ruby_html"
gem "sixarm_ruby_password_text"
gem "sixarm_ruby_person_name"
gem "sixarm_ruby_spreadsheeting"
gem "sixarm_ruby_unaccent"
gem "sixarm_ruby_hash_more"

## Bundle gems used only in certain environments:

group :test do
	gem "rspec-rails", ">= 2.0.0.beta.1"
	gem "faker"
	gem "autotest"
	# gem "shoulda", :git => "git://github.com/bmaddy/shoulda", :branch => "rails3"
  # git "git://github.com/adamhunter/shoulda.git", :ref => "rails3"
  gem "redgreen", :require => nil
  gem "shoulda", :require => nil

	gem 'capybara'
	gem 'database_cleaner'
	gem 'cucumber-rails'
end
