# frozen_string_literal: true

N,M = gets.split.map(&:to_i)
$s = gets.split.map(&:to_i).sort
$visited = Array.new(N,false)

def dfs(tmp)

  if tmp.size == M
    puts tmp.join(' ')
    return
  end

  prev = 0
  (0...$s.size).each do |i|
    if !$visited[i] && prev != $s[i]
      $visited[i] = true
      tmp << $s[i]
      prev = $s[i]
      dfs(tmp)
      tmp.pop
      $visited[i] = false
    end
  end
end

dfs([])
