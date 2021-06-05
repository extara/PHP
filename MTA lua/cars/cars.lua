function createVehicleForPlayer(player, command, model)
    local db = exports.db:getConnection()    
    local x, y, z = getElementPosition(player)
    y = y + 5
    
    --After creating vehicle, save them, create new row database (to configure DB stuff go into db.lua)
    dbExec(db, 'INSERT INTO cars (model, x, y, z) VALUES (?, ?, ?, ?)', model, x, y, z)
    
     local vehicleObject = createVehicle(model, x, y, z)
    
    dbQuery(function(queryHandle)
            local results = dbPoll(queryHandle, 0)
            local vehicle = results[1]
            
               
                setElementData(vehicleObcjet, "id", vehicle.id)

        end, db, 'SELECT id FROM cars ORDER BY id DESC LIMIT 1')
end
--Commands to resp car--
addCommandHandler('sc', createVehicleForPlayer, false, false)
addCommandHandler('resp', createVehicleForPlayer, false, false)

function doauta (source)
    local carID = getVehicleID ('SELECT id FROM cars ORDER BY id')
    local carPos = getElementPosition ('SELECT x, y, z FROM cars')
    
setElementPosition ( source, carID, carPos )
outputChatBox ( "Output on the chat (can be changed in cars.lua)", source, 0, 255, 0 ) 
end 
addCommandHandler ( "vtt", doauta )



function loadAllVehicles(queryHandle)
        local results = dbPoll(queryHandle, 0)

    for index, vehicle in pairs(results) do
        local vehicleObject = createVehicle(vehicle.model, vehicle.x, vehicle.y, vehicle.z)
        
        setElementData(vehicleObject, "id", vehicle.id)
    end
end
addEventHandler("onResourceStart", resourceRoot, function()
         local db = exports.db:getConnection()  
        
    dbQuery(loadAllVehicles, db, 'SELECT * FROM cars')
end)

addEventHandler('onResourceStop', resourceRoot, function()  
        local db = exports.db:getConnection() 
        local cars = getElementsByType('vehicle')
        
        for index, vehicle in pairs(cars) do
            local id = getElementData(vehicle,'id')
            local x, y, z = getElementPosition(vehicle)
            
            dbExec(db, 'UPDATE cars SET x = ?, y = ?, z = ? WHERE id = ?', x, y, z, id)
        
        end
    end)












--Create custom handling for vehicle id 415--

function handling (  ) 
for _,veh in pairs(getElementsByType("vehicle")) do 
    if getElementModel(veh) == 415 then 
        setVehicleHandling (veh, "mass", 1900) 
        setVehicleHandling(veh, "turnMass", 4921.3) 
        setVehicleHandling(veh, "dragCoeff", 1.8 ) 
        setVehicleHandling(veh, "centerOfMass", { 0, -0.4, 0 } ) 
        setVehicleHandling(veh, "percentSubmerged", 75) 
        setVehicleHandling(veh, "tractionMultiplier", 0.75) 
        setVehicleHandling(veh, "tractionLoss", 0.85) 
        setVehicleHandling(veh, "tractionBias", 0.52) 
        setVehicleHandling(veh, "numberOfGears", 5) 
        setVehicleHandling(veh, "maxVelocity", 400) 
        setVehicleHandling(veh, "engineAcceleration", 40 ) 
        setVehicleHandling(veh, "engineInertia", 10) 
        setVehicleHandling(veh, "driveType", "rwd") 
        setVehicleHandling(veh, "engineType", "petrol") 
        setVehicleHandling(veh, "brakeDeceleration", 10) 
        setVehicleHandling(veh, "brakeBias", 0.53) 
        setVehicleHandling(veh, "steeringLock", 35) 
        setVehicleHandling(veh, "suspensionForceLevel", 1.3) 
        setVehicleHandling(veh, "suspensionDamping", 0.12) 
        setVehicleHandling(veh, "suspensionHighSpeedDamping", 0) 
        setVehicleHandling(veh, "suspensionUpperLimit", 0.28 ) 
        setVehicleHandling(veh, "suspensionLowerLimit", -0.12) 
        setVehicleHandling(veh, "suspensionFrontRearBias", 0.38 ) 
        setVehicleHandling(veh, "suspensionAntiDiveMultiplier", 0) 
        setVehicleHandling(veh, "seatOffsetDistance", 0.2) 
        setVehicleHandling(veh, "collisionDamageMultiplier", 0.24) 
        setVehicleHandling(veh, "monetary", 25000) 
        setVehicleHandling(veh, "modelFlags", 0x40000000) 
        setVehicleHandling(veh, "handlingFlags", 0x10200008 ) 
        setVehicleHandling(veh, "headLight", 0) 
        setVehicleHandling(veh, "tailLight", 1) 
        setVehicleHandling(veh, "animGroup", 0) 
        end 
    end 
  
end 
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), handling ) 