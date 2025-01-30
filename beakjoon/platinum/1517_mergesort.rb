def merge_sort(s, e)
  return if e - s < 1

  m = (s + e) / 2
  merge_sort(s, m)
  merge_sort(m + 1, e)

  (s...e+1).each do |i|
    $tmp[i] = A[i]
  end

  index1 = s
  index2 = m+1
  k = s

  while index1 <= m - s && index2 <= e - s
    if $tmp[index1] > $tmp[index2]
      A[k] = $tmp[index2]
      $result += index2 - index1
      index2 += 1
    else
      A[k] = tmp[index1]
      index1 += 1
    end
    k += 1
  end

  while index1 <= m - s
    A[k] = tmp[index1]
    index1 += 1
    k += 1
  end

  while index2 <= e - s
    A[k] = tmp[index2]
    index2 += 1
    k += 1
  end
end

N = gets.to_i
A = [0] + gets.split.map(&:to_i)
$tmp = Array.new(N+1, 0)
$result = 0
merge_sort(1, N)
puts $result
