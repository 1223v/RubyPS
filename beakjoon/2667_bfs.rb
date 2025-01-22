# frozen_string_literal: true

N = gets.to_i
$graph = Array.new(N) { gets.chomp.chars.map(&:to_i)}
$visited = Array.new(N) { Array.new(N,false) }
$di = [0,0,1,-1]
$dj = [1,-1,0,0]

def bfs(ci,cj)
  queue = []
  cnt = 0

  queue << [ci,cj]
  $visited[ci][cj] = true

  until queue.empty?
    pi,pj = queue.shift
    cnt += 1

    4.times do |i|
      ni,nj = pi+$di[i], pj + $dj[i]
      if ni.between?(0,N-1) && nj.between?(0,N-1)
        if !$visited[ni][nj] && $graph[ni][nj] == 1
          $visited[ni][nj] = true
          queue << [ni,nj]
        end
      end
    end
  end
  cnt

end

result = []

N.times do |i|
  N.times do |j|
    if !$visited[i][j] && $graph[i][j] == 1
      result<<bfs(i,j)
    end
  end
end

result.sort!

puts result.size
puts result
