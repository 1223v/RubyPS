# frozen_string_literal: true
s1 = gets.chomp.chars
s2 = gets.chomp.chars

dp = Array.new(s1.length+1) {Array.new(s2.length+1,0)}

(1...s1.length+1).each do |i|
  (1...s2.length+1).each do |j|
    if s1[i-1] == s2[j-1]
      dp[i][j] = dp[i-1][j-1]+1
    else
      dp[i][j] = [dp[i-1][j], dp[i][j-1]].max
    end
  end
end

puts dp.flatten.max