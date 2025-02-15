# frozen_string_literal: true

N = gets.to_i
s = gets.split.map(&:to_i).sort
result = 0
(0...s.length).each do |i|
  left = 0
  right = N-1

  while left < right

    if s[left] + s[right] < s[i]
      left += 1
    elsif s[left] + s[right] > s[i]
      right -= 1
    else
      if left != i && right != i
        result += 1
        break
      elsif left ==i
        left += 1
      elsif right == i
        right -= 1
      end
    end
  end

end

puts result
