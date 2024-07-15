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

  point += if frame[0] == 10 # strike
             if frames[i][0] == 10
               10 + (i < 9 ? frames[i + 1][0] : frames[i][2])
             else
               frames[i][0] + frames[i][1]
             end
           else # spare
             frames[i][0]
           end
end
puts point
