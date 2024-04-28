#!/usr/bin/env ruby
# encoding: utf-8
require "optparse"
require "date"

# ---------------------------------------------------
# コマンドラインの引数で指定された月（-m）と年（-y）を取得する
# ---------------------------------------------------
params = ARGV.getopts("m:", "y:")

# 指定された月（-m）をmonthに格納する（指定がない場合は今月）
if params["m"] == nil
  month = Date.today.month
else
  month = params["m"].to_i
end

# 指定された年をyear（-y）に格納する（指定がない場合は今年）
if params["y"] == nil
  year = Date.today.year
else
  year = params["y"].to_i
end

# ---------------------------------------------------
# 変数の指定
# ---------------------------------------------------
# 指定された年月の初日を取得する
first_day = Date.new(year, month, 1)
# 指定された年月の最終日を取得する
last_day = Date.new(year, month, -1)
# 表示対象の月・年の位置調整（最大幅の指定）
target_month_title = 13
# 日付が1桁でも2桁でも右揃えにする（最大幅の指定）
date_width = 2

# ---------------------------------------------------
# カレンダーを作成
# ---------------------------------------------------
# 年月を表示する
puts "#{month}月 #{year}".rjust(target_month_title)
# 曜日を表示する
puts "日 月 火 水 木 金 土"

# 1日を正しい曜日から始めるためにスペースを入れる
print "   " * first_day.wday

# カレンダーの日付を表示する
(first_day..last_day).each do |date|
  print date.day.to_s.rjust(date_width) + " "
  # 土曜日または最終日の場合は改行する
  if date.wday == 6 || date == last_day
    puts "\n"
  end
end
