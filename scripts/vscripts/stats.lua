local json = require 'json'

OutputValues = {} 
a = "Time"
OutputValues[a] = "00:00"
b = "SoldierDeaths"
OutputValues[b] = 0
c = "JoshHP"
OutputValues[c] = 70
d = "ReviverHP"
OutputValues[c] = 40



function Activate()
	Josh = Entities:FindByName(nil, "Josh")
	thisEntity:SetThink(UpdateHealth, "HealthThink",0)
end

function UpdateHealth()
		if Josh:IsAlive() == true 
			then
				OutputValues["JoshHP"] = DoubleDigits(Josh:GetHealth())
				SendToConsole("@panorama_dispatch_event AddStyle(\'"..json.encode(OutputValues).." \')")
				return 0.1
			else	
				StartCoolCountdown()
				return nil
		end
end

function StartCoolCountdown()
	Countdown = 5
	thisEntity:SetThink(CoolCountdown, "CountDownThink", 0)
end

function CoolCountdown()
	OutputValues["JoshHP"] = DoubleDigits(Countdown)
	SendToConsole("@panorama_dispatch_event AddStyle(\'"..json.encode(OutputValues).." \')")
	Countdown = Countdown - 1 
	if Countdown < 0
		then 
			Entities:FindByName(nil, "josh_template"):ForceSpawn()
			Josh = Entities:FindByName(nil, "Josh")
			thisEntity:SetThink(UpdateHealth, "HealthThink",0)
			return nil 
		else
			return 1

	end

end

DeathCount = 0 
function AddDeathCount()
	DeathCount = DeathCount + 1
end

function GetTime(fTime)
	iTime = math.floor(Time())
	Minutes = DoubleDigits(math.floor(iTime/60))
	Seconds = DoubleDigits(iTime - Minutes*60)

	return Minutes..":"..Seconds
end

function DoubleDigits(n)
	if n < 10
		then 
			return "0"..n
		else 
			return n 
	end
end

function SendStatsToPanorama()
	OutputValues["Time"] = GetTime()
	OutputValues["SoldierDeaths"] = DeathCount
	SendToConsole("@panorama_dispatch_event AddStyle(\'"..json.encode(OutputValues).." \')")
end

function ReviverSpawned()
	thisEntity:SetThink(ReviverThink, "ReviverThink",0)
	Reviver = Entities:FindByName(nil, "s5_reviver")
end

function ReviverThink()
	OutputValues["ReviverHP"] = Reviver:GetHealth()
	
	if OutputValues["ReviverHP"] > 0
		then 
			SendStatsToPanorama()
			return 0.1
	else 
		OutputValues["ReviverHP"] = 0
		return nil
	end
end

function ForceStopThinks()
	SendToConsole("@panorama_dispatch_event AddStyle(\'"..json.encode(OutputValues).." \')")
	thisEntity:StopThink("HealthThink")
	thisEntity:StopThink("ReviverThink")
end