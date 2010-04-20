# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_wgd1_session',
  :secret => '0beba3e99d187d481dada23f52638509af6332a1e8e39f84c1532e298698605f4c1b8f9672082a66187e7e75057dbb26b0c8bb196f9f96eb44a9e243c959ebeb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
