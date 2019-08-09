-- mod returns a mod 10, big(n)mod returns a^b mod 10
mod = function(a) return math.floor(a - math.floor(a / 10) * 10) end
binmod = function(a, b)
  if b < 5 then
    return mod(math.pow(a, b))
  else
    local halfmod = binmod(a, b / 2)
    return bigmod(halfmod, 2)
  end
end
bigmod = function(a, b)
  if b < 2 then
    return mod(math.pow(a, b))
  else
    local check = 1
    for i = 0, 19 do
      local abit = 1 << i
      if (abit & b) > 0 then
        check = check * binmod(a, abit)
      end
    end
    return mod(check)
  end
end

-- interface
T = io.read('*n')
for t = 1, T do
  local a, b = io.read('*n', '*n')
  local result = bigmod(a, b)
  if result == 0 then
    print(10)
  else
    print(result)
  end
end
