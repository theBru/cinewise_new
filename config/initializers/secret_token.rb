# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#use the existing token
		File.read(token_file).chomp
	else
		#generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

Cinewise::Application.config.secret_key_base = '74cf63e633d985f86708784a4eb771d7600105a65c949b49e395a86bc88bb19c47ac555f7bd6903ff17372eb8ab4b7c2529c4b5a077831973cb45db58f92d5cb'
