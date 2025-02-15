# frozen_string_literal: true

# 입력 처리
N, M = gets.split.map(&:to_i)
graph = Array.new(N) { gets.split.map(&:to_i) }

time = 0
di = [0, 0, 1, -1]
dj = [1, -1, 0, 0]

# 빙산 좌표를 저장하는 해시
icebergs = {}
N.times do |i|
  M.times do |j|
    icebergs[[i, j]] = true if graph[i][j] > 0
  end
end

# BFS 함수
def bfs(i, j, visited, graph, di, dj)
  queue = [[i, j]]
  visited[[i, j]] = true

  while !queue.empty?
    ci, cj = queue.shift
    for d in 0...4
      ni = ci + di[d]
      nj = cj + dj[d]
      if ni >= 0 && ni < N && nj >= 0 && nj < M && !visited[[ni, nj]] && graph[ni][nj] > 0
        visited[[ni, nj]] = true
        queue.push([ni, nj])
      end
    end
  end
end

# 시뮬레이션 시작
while true
  count = 0
  visited = {}

  new_icebergs = {}
  melt_list = []

  # 빙산 탐색 및 BFS 실행
  icebergs.keys.each do |i, j|
    if !visited[[i, j]]
      bfs(i, j, visited, graph, di, dj)
      count += 1
    end

    # 녹을 양 계산
    melt = 0
    for d in 0...4
      ni = i + di[d]
      nj = j + dj[d]
      if ni >= 0 && ni < N && nj >= 0 && nj < M && graph[ni][nj] == 0
        melt += 1
      end
    end

    if melt > 0
      melt_list.push([i, j, melt])
    else
      new_icebergs[[i, j]] = true
    end
  end

  # 빙산 녹이기
  melt_list.each do |i, j, melt|
    graph[i][j] -= melt
    if graph[i][j] > 0
      new_icebergs[[i, j]] = true
    else
      graph[i][j] = 0
    end
  end

  # 빙산 목록 갱신
  icebergs = new_icebergs

  if count > 1
    puts time
    break
  end

  if icebergs.empty?
    puts 0
    break
  end

  time += 1
end
