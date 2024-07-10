#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
(1..10).each do |i|
  frames << if i < 10
              shots.shift(2)
            else
              shots
            end
end

point = 0
frames.each.with_index(1) do |frame, i|
  point += frame.sum
  next if frame.sum != 10 || i >= 10

  point += if i < 10 && frame[0] == 10 # strike
             if i < 9 && frames[i][0] == 10
               10 + frames[i + 1][0]
             elsif i == 9 && frames[i][0] == 10
               10 + frames[i][2]
             else
               frames[i][0] + frames[i][1]
             end
           elsif i < 10 && frame.sum == 10 # spare
             frames[i][0]
           end
end
puts point
