#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'JSON'
require 'HTTParty' 
require 'csv' 
require 'dotenv'
Dotenv.load ('.env')
TOKEN = ENV['TOKEN']
response = HTTParty.get("https://faria.openapply.com/api/v3/students?access_token=#{TOKEN}&per_page=10", format: :plain)
JSON.parse response, symbolize_names: true
obj = JSON.parse response
puts obj.class
ss = obj["students"]
puts ss
    
column_names = ss.first.keys
s=CSV.generate do |csv|
  csv << column_names
  ss.each do |x|
    csv << x.values
  end
end
File.write('all_info.csv', s)


