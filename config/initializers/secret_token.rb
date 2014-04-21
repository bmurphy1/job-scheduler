# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
TaskServer::Application.config.secret_key_base = '57be4a1c2068d94b7372572cbdb30d8a54d4052d0c028a23f9afe35a7b480596d9bcbb169db87b5674963fe5654747d9568bcbb674fae2a9f94dfbe0ccc072b5'
