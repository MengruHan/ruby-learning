#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'JSON'
require 'FARADAY'
require 'CSV' 
require 'dotenv'
Dotenv.load ('.env')
TOKEN = ENV['TOKEN']
response = Faraday.get("https://faria.openapply.cn/api/v1/students?auth_token=#{TOKEN}&per_page=10")
puts response   #将返回一个 “#<Faraday::Response:0x00007fdea703df58>”带有响应状态，标头和正文的对象
# puts response.status  # =>响应状态 200
# puts response.headers  # => 标头
# puts response.body   # => 正文
JSON.parse (response.body),symbolize_names: true # 解析JSON字符串
info = JSON.parse (response.body)   #所有的信息
# puts info.class
stud = info["students"] 
# puts stud    # 学生的信息
# f=File.new(File.join("/Users/ruhan/files","Test.csv"), "w+") #创建一个新的csv文件(w+	读写模式。如果文件存在，则重写已存在的文件。如果文件不存在，则创建一个新文件用于读写。)
# file = File.open(File.join("/Users/ruhan/files","students.csv"),"w+")   #file.join 返回一个字符串，由指定的项连接在一起
# file.new 方法创建一个 File 对象用于读取、写入或者读写，读写权限取决于 mode 参数
# File.open 方法创建一个新的 file 对象，并把该 file 对象赋值给文件。
column_name = stud.first.keys     # 散列的第一个列
# s = CSV.generate do |csv| 
      
#  csv << column_name
#  stud.each do |x|            #遍历values值
#    csv << x.values
#  end
# end
#f.colse
          
# File.write(file , s)        #把s写入到file（文件）里面
# file.close  #File.close 方法来关闭该文件

CSV.open("/Users/ruhan/files/file.csv", "wb") do |csv|
  csv << column_name
  stud.each do |x|            #遍历values值
  csv << x.values
  end
end    