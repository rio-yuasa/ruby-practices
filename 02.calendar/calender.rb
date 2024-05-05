#!/usr/bin/env ruby
# encoding: utf-8
require "optparse"
require "date"

params = ARGV.getopts("m:", "y:")

month = params["m"] ? params["m"].to_i : Date.today.month
year = params["y"] ? params["y"].to_i : Date.today.year

first_date = Date.new(year, month, 1)
last_date = Date.new(year, month, -1)

date_width = 2

puts "#{month}月 #{year}".center(20)
puts "日 月 火 水 木 金 土"

print "   " * first_date.wday

(first_date..last_date).each do |date|
  print date.day.to_s.rjust(date_width) + " "
  puts "\n" if date.saturday? || date == last_date
end
