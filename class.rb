#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'JSON'
require 'FARADAY'
require 'CSV' 
require 'dotenv'
Dotenv.load ('.env')
TOKEN = ENV['TOKEN']
response = Faraday.get("https://faria.openapply.cn/api/v1/students?auth_token=#{TOKEN}&per_page=10")
puts response
JSON.parse (response.body),symbolize_names: true # 解析JSON字符串
info = JSON.parse (response.body)
stud = info["students"]
column_name = stud.first.keys
CSV.open("/Users/ruhan/files/file.csv", "wb") do |csv|
    csv << column_name
    stud.each do |x|            #遍历values值
    csv << x.values
    end
end

class Person
    def initialize(id,first_name,last_name,email,gender)
        @id =id
        @first_name = first_name
        @last_name  = last_name
        @email = email
        @gender = gender
    end

    def full_name
        @first_name + @last_name
    end
   
end
stud.each do |s|
    person = Person.new(s["id"], s['first_name'], s['last_name'], s['email'], s['gender'])
    p person.full_name
    
end

    
    




