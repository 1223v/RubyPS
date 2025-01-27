N,M = gets.split.map(&:to_i)
$s = gets.split.map(&:to_i).sort
$tmp = []
$visited = Array.new(N+1,false)
def dfs(v)

  if $tmp.size == M
    puts $tmp.join(' ')
    return

  end
  prev = 0
  (v...$s.size).each do |i|
    if !$visited[i] && prev != $s[i]
      $visited[i] = true
      $tmp << $s[i]
      prev = $s[i]
      dfs(i)
      $tmp.pop
      $visited[i] = false
    end
  end
end

dfs(0)
