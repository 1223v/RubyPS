# frozen_string_literal: true

require 'set'

def dfs(graph,visited,v)
  visited[v] = true
  print "#{v} "
  graph[v].sort.each do |i|
    dfs(graph, visited, i) unless visited[i]
  end
end

def bfs(graph,visited,v)
  visited[v] = true
  queue = []
  queue.push(v)

  until queue.empty?
    x = queue.shift
    print "#{x} "
    graph[x].sort.each do |i|
      next if visited[i]

      visited[i] = true
      queue.push(i)
    end
  end
end

n,m,v = gets.split.map(&:to_i)
graph = Array.new(n+1) { [] }
visited = Array.new(n+1, false)

m.times do
  s, e = gets.split.map(&:to_i)
  graph[s] << e
  graph[e] << s
end

dfs(graph, visited, v)
puts
visited = Array.new(n+1, false)
bfs(graph, visited, v)
