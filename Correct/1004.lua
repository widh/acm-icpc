function check(px, py, cx, cy, r)
  return math.sqrt(math.pow((px - cx), 2) + math.pow((py - cy), 2)) < r
end

tci = io.read('*n')

for i = 1, tci do
  local x1, y1, x2, y2 = io.read('*n', '*n', '*n', '*n')
  local psn = io.read('*n')
  local psc = 0
  for j = 1, psn do
    local cx, cy, r = io.read('*n', '*n', '*n')
    if check(x1, y1, cx, cy, r) ~= check(x2, y2, cx, cy, r) then
      psc = psc + 1
    end
  end
  print(psc)
end
