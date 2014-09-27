#!/bin/env ruby

# to get gems, installed by bundler
require 'rubygems'
require 'bundler/setup'

# for ask()
require 'highline/import'

# for SecureRandom.random_number
require 'securerandom'

password = ask('Password: ') do |question| 
  question.echo = false # hide the user input
end

allowed_salt_symbols = ('a'..'z').to_a | ('A'..'Z').to_a | %w(.)

salt = (0..35).to_a.map { allowed_salt_symbols[SecureRandom.random_number(allowed_salt_symbols.length)] }.join();

puts password.crypt('$6$' + salt)