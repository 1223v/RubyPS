# frozen_string_literal: true

N,M = gets.split.map(&:to_i)

distance = Array.new(N+1, -Float::INFINITY)
put = Array.new(N+1, 0)
graph = []

(0...M).each do |i|
  s,e,cost = gets.split.map(&:to_i)
  graph << [s,e,cost]

end

def bf(start,n, distance, put, graph)
  distance[start] = 0

  n.times do |i|
    graph.each do |s,e,cost|
      if distance[e] < distance[s] + cost && distance[s] != -Float::INFINITY
        distance[e] = distance[s] + cost
        put[e] = s
        if i == n-1
          distance[e] = Float::INFINITY
        end
      end
    end
  end

  if distance[n] == Float::INFINITY
    return -1
  end
  result = []
  k = n
  while k != 1
    result << k
    k = put[k]
  end

  result << k
  result.reverse

end

res = bf(1,N, distance, put, graph)
if res == -1
  puts -1
else
  puts res.join(' ')
end
