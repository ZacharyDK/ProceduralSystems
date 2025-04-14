--[[
So factorio implements math.random() which can be used a the prototype stage. It is deterministic. 
In order to use this at the prototype stage, we have to roll math.random() to find a different spot in the seed to start
We cannot use math.randomseed() - that is a runtime feature. I will be making us of some of rjdunlap's code, but will be reformatting
things my own way
--]]

local stream = {}

--rjdunlap's clever code to roll the global math.random() seed such that calls to math.random() are now deterministic.
--Lets just handle this before dealing with anything else.
stream.preFeed = function()
    -- feed seed
    local seed = settings.startup["procedural-systems-random-seed"].value
    local v = 0
    for i = 0, seed % 2 do
        v = math.random()
    end
    for i = 0, seed % 3 do
        v = math.random()
    end
    for i = 0, seed % 5 do
        v = math.random()
    end
    for i = 0, seed % 7 do
        v = math.random()
    end
    for i = 0, seed % 11 do
        v = math.random()
    end
    for i = 0, seed / 13 do
        v = math.random()
    end
    for i = 0, seed / 17 do
        v = math.random()
    end
    for i = 0, seed % 19 do
        v = math.random()
    end
    for i = 0, seed % 23 do
        v = math.random()
    end
    for i = 0, seed % 29 do
        v = math.random()
    end
end

stream.random = function()
    return math.random()
end

stream.random_bound = function(int_lower,int_upper)
    return math.random(int_lower,int_upper)
end

stream.random_from_table_shallow = function(in_table)
    return in_table[math.random(1, #in_table)]
end

stream.random_from_table_deep = function(in_table)
    local out_table = table.deepcopy(in_table)
    return out_table[math.random(1, #out_table)]
end

stream.pick_random_and_remove_from_table = function(in_table)
    local number = math.random(1, #in_table)
    local removed = table.remove(in_table,number)
    return removed
end

return stream