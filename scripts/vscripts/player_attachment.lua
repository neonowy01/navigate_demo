function Activate()
	HudOgVector = thisEntity:GetOrigin()
	thisEntity:SetThink(ChangePosition, "PositionThink", 0)
end

--x
function ChangePosition()
	if player ~= nil then 
		if PlayerStartingX == nil 
			then 
			PlayerStartingX = player:GetOrigin().x
		end
		PlayerOrigin = player:GetOrigin()
		--print("Player", PlayerOrigin)
		--print("PlayerStartingOrigin", PlayerStartingY)
		--print("PlayerOriginY", PlayerOrigin.y )
		XDiff = PlayerStartingX - PlayerOrigin.x
		--print(YDiff)
		HudVector = Vector(HudOgVector.x - XDiff, PlayerOrigin.y, HudOgVector.z)
		thisEntity:SetOrigin(HudVector)
		--print("Hud", thisEntity:GetOrigin())
	end
	return 0
end