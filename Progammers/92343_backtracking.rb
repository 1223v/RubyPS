# frozen_string_literal: true

def solution(info, edges)
  graph = Array.new(info.length) { [] }
  visited = Array.new(info.length,0)

  max_value = 1

  edges.each do |s,e|
    graph[s] << e
  end

  def dfs(graph, visited, info, v, sheep, wolf, now_lst, max_value_ref)
    if sheep <= wolf || now_lst.empty?
      return
    end

    now_lst += graph[v]

    now_lst.each do |i|

      if visited[i] == 0
        visited[i] = 1
        if info[i] == 0
          dfs(graph,visited,info,i,sheep+1,wolf, now_lst, max_value_ref)
        else
          dfs(graph,visited,info, i, sheep, wolf+1, now_lst, max_value_ref)
        end
        visited[i] = 0
      end

    end
    max_value_ref[0] = [max_value_ref[0],sheep].max

  end

  visited[0] = 1
  max_value_ref = [max_value]
  dfs(graph,visited,info,0,1,0,[0],max_value_ref)

  max_value_ref[0]
end

# 테스트 케이스를 실행합니다.
puts solution([0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0], [[0, 1], [0, 2], [1, 3], [1, 4], [2, 5], [2, 6], [3, 7], [4, 8], [6, 9], [9, 10]])
