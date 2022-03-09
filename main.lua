

--Initialisation
local allData = {}

local with = love.graphics.getWidth()

local timer = 1

--Create Data
function DataCreate()
  local data = {}
  data.number = love.math.random(0,1)
  data.x =  love.math.random(0,with)
  data.y = -10
  data.vitesse = love.math.random(0,10)
  data.alpha = love.math.random(0.3,1)
  data.scale = 2
  table.insert(allData,data)
end

function love.load()
  love.window.setTitle("Matrix")
end

function love.update()
  
  --Generate Data
  timer = timer - 10
  if timer < 0 then
    DataCreate()
    timer = 1
  end
  
  if #allData > 150 then
    
    table.remove(allData,1)
    
  end
  
end

function love.draw()

love.graphics.print(tostring(#allData),100,100)
for fall, data in ipairs(allData) do
  
  data.y = data.y + 5
  love.graphics.setColor(0,1,0,data.alpha)
  love.graphics.print(tostring(data.number),data.x,data.y,0,data.scale,data.scale)
  love.graphics.reset()
  
end

end