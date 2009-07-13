# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_geogeo_session',
  :secret      => 'c733eba3d611431a304d143c1452fa5526b069593f13b07e5e9661ceaf403ed3ba6eec4f580062694b62afee2deb4cc739910f41bc8e0db60bf5fa251db7a628'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
