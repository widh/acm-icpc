tci = io.read('*n')

for i = 1, tci do
  local cache = {}

  -- read buildings & rules
  local bi, ri = io.read('*n', '*n')
  local bt = {}
  local br = {}
  for j = 1, bi do
    bt[j] = io.read('*n')
  end
  for j = 1, ri do
    local pre, post = io.read('*n', '*n')
    if br[post] == nil then
      br[post] = { pre }
    else
      table.insert(br[post], pre)
    end
  end

  -- define calc function
  function calc(times, rules, target)
    if rules[target] == nil then
      return times[target]
    elseif cache[target] ~= nil then
      return cache[target]
    else
      local max = 0
      for i = 1, #rules[target] do
        local time = calc(times, rules, rules[target][i])
        if max < time then
          max = time
        end
      end
      cache[target] = times[target] + max
      return times[target] + max
    end
  end

  -- read & calc target
  local tg = io.read('*n')
  print(calc(bt, br, tg))
end
