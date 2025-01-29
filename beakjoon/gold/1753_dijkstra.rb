# frozen_string_literal: true
require 'priority_queue'
V, E = gets.split.map(&:to_i)
K = gets.to_i
$graph = Array.new(V+1){[]}
$distance = Array.new(V+1, Float::INFINITY)

E.times do |i|
  s,e,cost = gets.split.map(&:to_i)
  $graph[s] << [e,cost]
end

def dijkstra(start)

  pq = PriorityQueue.new
  pq.push(0,start)
  $distance[start] = 0

  while !pq.empty?
    now,dist = pq.delete_min
    if dist > $distance[now]
      next
    end

    $graph[now].each do |next_node, cost|
      if $distance[next_node] > cost + dist
        $distance[next_node] = cost + dist
        pq.push(cost + dist, next_node)
      end
    end

  end

  (1...$distance.size).each do |i|
    puts $distance[i]
  end

end

dijkstra(K)
