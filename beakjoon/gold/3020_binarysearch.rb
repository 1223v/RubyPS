N, M = gets.split.map(&:to_i)

graph = Array.new(M,0)

N.times do |i|

  B = gets.to_i

  if i %2 == 0
    graph[0] += 1
    graph[B] -= 1

  else
    graph[M-B] += 1
  end
end

(1...M).each do |i|

  graph[i] += graph[i-1]
end

puts "#{graph.min} #{graph.count(graph.min)}"
