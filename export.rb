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
# puts obj.class
i = obj["students"]





    column = i.first.keys     # 散列的第一个列
s=CSV.generate do |csv| 
  csv << column
  i.each do |x|    
    csv << x.values
  end
end
File.write('test04.csv', s)


