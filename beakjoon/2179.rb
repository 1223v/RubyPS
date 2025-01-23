# frozen_string_literal: true

N = gets.to_i
s = Array.new(N) {gets.chomp} # 줄바꿈 : chomp

result_value = 0
result = []
(0...N).each do |i|
  (i + 1...N).each do |j|
    si = s[i]
    sj = s[j]
    min_value = [si.length, sj.length].min
    max_value = 0
    length = 0

    min_value.times do |k|
      if si[k] != sj[k]
        max_value = [max_value, length].max
        break

      else
        length += 1
      end

    end
    if min_value == length
      max_value = [max_value, length].max
    end
    if result_value < max_value
      result = [si,sj]
      result_value = max_value
    end
  end
end

puts result[0]
puts result[1]