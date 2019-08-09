fact = function(n)
  if n == 0 then
    return 1
  else
    return n * fact(n - 1)
  end
end
comb = function(n, r)
  if n < r then
    return 0
  else
    return fact(n) / (fact(r) * fact(n - r))
  end
end
bigcomb = function(n, r)
  if n < 13 then
    return comb(n, r)
  elseif r == 1 then
    return n
  elseif r < 1 then
    return 1
  else
    return bigcomb(n - 1, r - 1) + bigcomb(n - 1, r)
  end
end

for t = 1, io.read('*n') do
  local N, M = io.read('*n', '*n')
  print(math.floor(bigcomb(M, N)))
end
