getgenv().notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L8X/notificationstuff/main/src.lua", true))()

local function notify(title, duration)
    notification(
        {
            Text = title,
            Duration = duration
        }
    )
end
getgenv().notify = notify

local alert = function(msg)
    notify(msg, 5)
end

--Kaid#0001 | Memcheck bypass
math.randomseed(tick())
local cclosure = syn_newcclosure or newcclosure or nil

if cclosure and hookfunction and getrenv then
    local minMem = 1e12
    local maxMem = 0
    local currMem = 0
    alert("Loading Memcheck Bypass...")
    local scanned = false
    coroutine.wrap(function()
        task.wait(6)
        scanned = true
    end)()
    repeat
        task.wait()
        local mem = gcinfo()
        currMem = mem
        if mem < minMem then
            minMem = mem
        elseif mem > maxMem then
            maxMem = mem
        end
    until scanned and minMem ~= 1e12 and maxMem ~= 0

    coroutine.wrap(function()
        while task.wait() do
            currMem = currMem + math.random(1,12)
            if currMem > maxMem then
                repeat task.wait()
                    currMem = currMem - math.random(30,50)
                until currMem < minMem
                currMem = minMem + math.random(-5,5)
            end
        end
    end)()
    hookfunction(getrenv().gcinfo,cclosure(function()
        return currMem
    end))
    hookfunction(getrenv().collectgarbage,cclosure(function()
        return currMem
    end))
    task.wait(.1)
    alert("Loaded Memcheck Bypass ~Kaid")
elseif hookfunction and getrenv then
    local minMem = 1e12
    local maxMem = 0
    local currMem = 0
    alert("Loading Memcheck Bypass...")
    local scanned = false
    coroutine.wrap(function()
        task.wait(6)
        scanned = true
    end)()
    repeat
        task.wait()
        local mem = gcinfo()
        currMem = mem
        if mem < minMem then
            minMem = mem
        elseif mem > maxMem then
            maxMem = mem
        end
    until scanned and minMem ~= 1e12 and maxMem ~= 0

    coroutine.wrap(function()
        while task.wait() do
            currMem = currMem + math.random(1,12)
            if currMem > maxMem then
                repeat task.wait()
                    currMem = currMem - math.random(30,50)
                until currMem < minMem
                currMem = minMem + math.random(-5,5)
            end
        end
    end)()
    hookfunction(getrenv().gcinfo,function()
        return currMem
    end)
    hookfunction(getrenv().collectgarbage,function()
        return currMem
    end)
    task.wait(.1)
    alert("Your shitty exploit doesn't even support cclosure? Still bypassed memcheck but WTF. (Go buy synapse at x.synapse.to or scriptware at script-ware.com) ~Kaid")
else
    alert("Your shitty exploit doesn't support memcheck bypassing! (Go buy synapse at x.synapse.to or scriptware at script-ware.com) ~Kaid")
end
task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/L8X/ExProDex-V2/main/src.lua", false))()
