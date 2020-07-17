#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'rubygems'
require 'JSON'
require 'HTTParty'
require 'pp' 
require 'dotenv'
Dotenv.load ('.env')
TOKEN = ENV['TOKEN']
response = HTTParty.get("https://faria.openapply.com/api/v3/students?access_token=#{TOKEN}&per_page=10", format: :plain)
JSON.parse response, symbolize_names: true
obj = JSON.parse response
puts obj
parents = obj["linked"]["parents"]
puts parents.class
for i in parents do
    puts i["first_name"]
end