# frozen_string_literal: true
N,M = gets.split.map(&:to_i)
s = gets.split.map(&:to_i).uniq.sort

def dfs(s,n,tmp)
  if n == M
    puts tmp.join(' ')
    return
  end

  (0...s.size).each do |i|
    tmp << s[i]
    dfs(s,n+1,tmp)
    tmp.pop
  end
end

dfs(s,0,[])
