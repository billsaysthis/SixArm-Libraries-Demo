# Edit this Gemfile to bundle your application's dependencies.
source 'http://gemcutter.org'


gem "rails", '3.0.0.beta3'

# ActiveRecord requires a database adapter. By default,
# Rails has selected sqlite3.
gem "sqlite3-ruby", :require => "sqlite3"
gem "show_for"
# gem "meta_search"

## Sixarm gems:
gem "webget_ruby_colorful"
gem "webget_ruby_html"
gem "webget_ruby_password_text"
gem "webget_ruby_person_name"
gem "webget_ruby_spreadsheeting"
gem "webget_ruby_unaccent"
gem "webget_ruby_hash_more"

## Bundle gems used only in certain environments:

group :development do
	gem "hirb"
	# gem "hermes"
end

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
