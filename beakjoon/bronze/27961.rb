# frozen_string_literal: true
N = gets.to_i

cat = 0
magic = 0

while N > cat
  if cat == 0
    cat += 1
  else
    cat *= 2
  end
  magic += 1
end
puts magic