# frozen_string_literal: true
N,M = gets.split.map(&:to_i)

s = gets.split.map(&:to_i).uniq.sort

def dfs(n,tmp,v,s)
  if n == M
    puts tmp.join(' ')
    return
  end

  (v...s.size).each do |i|
    tmp << s[i]
    dfs(n+1, tmp, i,s)
    tmp.pop
  end
end

dfs(0,[],0,s)
