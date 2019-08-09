-- Possible cause = Wrong algorithm (obvious)

tci = io.read('*n')

for i = 1, tci do
  -- hrg = half of regions, sfi = special force index
  -- rei = region enemy index
  local hrg, sfi = io.read('*n', '*n')
  local rei = {}
  for j = 1, hrg * 2 do
    rei[j] = io.read('*n')
  end

  function getAdjacents(rgi)
    local adj = {}

    if hrg > 1 then
      if rgi % hrg == 0 then
        table.insert(adj, rgi - hrg + 1)
      else
        table.insert(adj, rgi + 1)
      end
    end

    if hrg > 2 then
      if rgi % hrg == 1 then
        table.insert(adj, rgi + hrg - 1)
      else
        table.insert(adj, rgi - 1)
      end
    end

    if rgi > hrg then
      table.insert(adj, rgi - hrg)
    else
      table.insert(adj, rgi + hrg)
    end

    return adj
  end

  function goJunction(rgc)

  -- rgi = region iter, rgc = region sf-s in charge
  -- sfn = special force number
  local sfn = 0
  local rgc = {}
  for rgi = 1, hrg * 2 do
    if rgc[rgi] == nil then
      -- mxc = max covered enemies, mxr = max covered another region
      local mxc = 0
      local mxr = nil

      local adj = getAdjacents(rgi)
      for j = 1, #adj do
        -- res = region enemy summation
        local res = rei[rgi] + rei[adj[j]]
        if (rgc[adj[j]] == nil) and (res <= sfi) and (res > mxc) then
          mxc = res
          mxr = adj[j]
        end
      end

      if mxr ~= nil then
        rgc[mxr] = sfn
      end
      rgc[rgi] = sfn

      sfn = sfn + 1
    end
  end

  print(sfn)
end
