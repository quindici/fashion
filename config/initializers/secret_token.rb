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
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Hdil2::Application.config.secret_key_base = secure_token
#Hdil2::Application.config.secret_key_base = 'a9730f2b4817af4d2d4f9c04fb20175ae2f0e1e5a6ea0ac32534207fa42ee850531cb564272ec3ad31d29c5cd733a0114a2e5e5e6c65f9c674f8ec79a76e70c8'
