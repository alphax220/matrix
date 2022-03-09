

--Initialisation
local allData = {}

local with = love.graphics.getWidth()

local timer = 1

local text = {}
text.mat = "MATRIX"
text.scaleX = 2
text.scaleY = 2
text.x = love.graphics.getWidth()/2 -200
text.y = love.graphics.getHeight()/2 - 100
text.alpha = 0
text.increase = false
text.green = 1

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
  
  
  --Increase scale Text
  if text.increase == false then
  text.scaleX = text.scaleX + 0.01
  text.scaleY = text.scaleY + 0.01
  text.alpha = text.alpha + 0.001
  end
  
  if text.alpha > 1 then
    text.alpha = 1
  end
  
  if text.scaleX > 10 then
    text.increase = true
    text.green = 0
    love.quit()
  end

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

 love.graphics.setColor(0,text.green,0,text.alpha)
 love.graphics.print(text.mat,text.x,text.y,0,text.scaleX,text.scaleY)
 love.graphics.reset()

for fall, data in ipairs(allData) do
  
  data.y = data.y + 5
  love.graphics.setColor(0,text.green,0,data.alpha)
  love.graphics.print(tostring(data.number),data.x,data.y,0,data.scale,data.scale)
  love.graphics.reset()
  
end

end

