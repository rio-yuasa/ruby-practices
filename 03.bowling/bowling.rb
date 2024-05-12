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
frames.each_with_index do |frame, i|
  point += if i < 9 && frame[0] == 10 # strike
             if i < 8 && frames[i + 1][0] == 10
               10 + 10 + frames[i + 2][0]
             elsif i == 8 && frames[i + 1][0] == 10
               10 + 10 + frames[i + 1][2]
             else
               10 + frames[i + 1][0] + frames[i + 1][1]
             end
           elsif i < 9 && frame.sum == 10 # spare
             10 + frames[i + 1][0]
           else
             frame.sum
           end
end
puts point
