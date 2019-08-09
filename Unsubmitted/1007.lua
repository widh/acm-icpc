-- Checks if two points are not equal
isDiff = function(c1, c2) return not ((c1[1] == c2[1]) and (c1[2] == c2[2])) end
-- Comparison function used in sort
compare = function(v1, v2) return v1[1] < v2[1] end

T = io.read('*n')

for t = 1, T do
  -- Initialize variables
  local V = {}
  local P = {}

  -- Get points and calculate distances between them
  local N = io.read('*n')
  for n = 1, N do
    local x, y = io.read('*n', '*n')
    for i, p in pairs(P) do
      local d = math.sqrt(math.pow(x - p[1], 2) + math.pow(y - p[2], 2))
      table.insert(V, {d, p, {x, y}})
    end
    table.insert(P, {x, y})
  end
  table.sort(V, compare)

  -- Get the smallest summation
  local max = 0
  repeat
    local d, p1, p2 = V[1][1], V[1][2], V[1][3]
    max = max + d
    local newV = {}
    for i, v in pairs(V) do
      if isDiff(v[2], p1) and isDiff(v[2], p2) and isDiff(v[3], p1) and isDiff(v[3], p2) then
        table.insert(newV, v)
      end
    end
    V = newV
  until (#V == 0)
  print(max)
end
