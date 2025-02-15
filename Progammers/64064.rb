# frozen_string_literal: true
require 'set'

def solution(user_id, banned_id)
  answer = Set.new
  ban_possibility = Array.new(banned_id.length) { [] }

  banned_id.each_with_index do |ban_id, k|
    user_id.each do |use_id|
      if ban_id.length == use_id.length
        flag = false
        ban_id.chars.each_with_index do |char, i|
          if char != "*" && use_id[i] != char
            flag = true
            break
          end
        end
        ban_possibility[k] << use_id unless flag
      end
    end
  end

  result = ban_possibility.inject([[]]) { |a, b| a.product(b).map(&:flatten) }

  result.each do |m|
    if m.uniq.length == banned_id.length
      answer.add(m.sort)
    end
  end

  puts answer.inspect
  answer.length
end

puts solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"])
