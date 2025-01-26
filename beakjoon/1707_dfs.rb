# frozen_string_literal: true

TC = gets.to_i

def dfs(v)
  $visited[v] = true
  $graph[v].each do|i|
    if !$visited[i]
      $check[i] = ($check[v] + 1) % 2
      dfs(i)
    elsif $check[v] == $check[i]
      $is_even = false
    end
  end
end

TC.times do
  N,E = gets.split.map(&:to_i)
  $is_even = true
  $graph = Array.new(N+1) {[]}
  $visited = Array.new(N+1,false)
  $check = Array.new(N+1,0)

  E.times do
    s,e = gets.split.map(&:to_i)
    $graph[s] << e
    $graph[e] << s
  end

  (1..N).each do |i|
    if $is_even
      dfs(i)
    end

  end
  puts $is_even ? "YES" : "NO"
end
