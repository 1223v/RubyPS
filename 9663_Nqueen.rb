
# frozen_string_literal: true
N = gets.to_i
visited1 = Array.new(N,0)
visited2 = Array.new(2*N, 0)
visited3 = Array.new(2*N, 0)

def dfs(n,visited1,visited2,visited3)
  if n == N
    $result += 1
    return
  end

  (0...N).each do |i|
    if visited1[i] == visited2[n-i] && visited2[n-i] == visited3[n+i] && visited3[n+i] == 0
      visited1[i],visited2[n-i], visited3[n+i]= 1,1,1
      dfs(n+1,visited1,visited2,visited3)
      visited1[i],visited2[n-i], visited3[n+i]= 0,0,0
    end
  end
end

$result = 0
dfs(0,visited1,visited2,visited3)
puts "#{$result}"