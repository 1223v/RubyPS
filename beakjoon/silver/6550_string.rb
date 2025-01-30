# frozen_string_literal: true

while true
  input = gets
  if input.nil? || input.strip.empty?
    exit(0)
  end

  value = 0
  flag = 0
  S,T = input.split.map(&:to_s)

  (0...T.length).each do |i|
    if T[i] == S[value]
      value += 1
      if value == S.length
        flag = 1
        break
      end
    end
  end

  if flag == 1
    puts "Yes"
  elsif flag ==0
    puts "No"
  end

end
