iter = tonumber(io.read('*l'))

fibot = {[0] = {1, 0}, [1] = {0, 1}}

function fibo(num)
  if fibot[num] == nil then
    local fibon1 = fibo(num - 1)
    local fibon2 = fibo(num - 2)
    fibot[num] = {fibon1[1] + fibon2[1], fibon1[2] + fibon2[2]}
  end
  return fibot[num]
end

for i = 1, iter do
  local line = io.read('*l')
  if line ~= nil then
    local result = fibo(tonumber(line))
    print(result[1] .. ' ' .. result[2])
  end
end
