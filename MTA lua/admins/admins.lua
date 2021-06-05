-- JETPACK
function consoleJetPack ( thePlayer, commandName )
   if ( not doesPlayerHaveJetPack ( thePlayer ) ) then            -- if the player doesn't have a jetpack
      local status = givePlayerJetPack ( thePlayer )              -- give him one
      if ( not status ) then
         outputConsole ( "Failed to give jetpack.", thePlayer )   -- tell him if it failed
      end
   else
      local status = removePlayerJetPack ( thePlayer )            -- remove his jetpack
      if ( not status ) then
         outputConsole ( "Failed to remove jetpack.", thePlayer ) -- tell him if it failed
      end
   end
end


addCommandHandler ( "jp", consoleJetPack )
-- JETPACK

--XYZ Display
function getpos ( thePlayer )
	local x,y,z = getElementPosition(thePlayer)
        if x then
        outputChatBox ( "Twoja aktualna pozycja to : ".. x ..", ".. y ..", ".. z-1 .."",thePlayer,0,255,0,false)
else
outputChatBox("Fail to get your Position.", thePlayer, 0, 255, 0, true)
end
end
addCommandHandler ( "pos", getpos )
addCommandHandler ( "xyz", getpos )
addCommandHandler ( "position", getpos )
---XYZ Display



--TELEPORTY
function slotnisko (source) 
setElementPosition ( source, 384.0750,2541.4612,16.5391) 
outputChatBox ( "Teleportujesz się na stare lotnisko", source, 0, 255, 0 ) 
end 
addCommandHandler ( "slotnisko", slotnisko )

function spawn (source) 
setElementPosition ( source, 0, 0, 5) 
outputChatBox ( "Teleportujesz się na spawn", source, 0, 255, 0 ) 
end 
addCommandHandler ( "spawn", spawn )



--TELEPORTY


--chat
function cleanAll (player)
    for index, player in ipairs ( getElementsByType ( "player" ) ) do
        unbindKey ( player, "O", "down", showPanel )             
    end
end
addEventHandler ( "onResourceStop", getResourceRootElement ( getThisResource() ), cleanAll)

function cc(thePlayer)
	   	outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
	   	outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
	   	outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")		
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")		
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")		
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
		outputChatBox(" ")	
outputChatBox ( "Chat został oczyszczony z plugastwa", source, 0, 255, 0 ) 		
end
addCommandHandler("clearchat", cc)