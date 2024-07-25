local json = require 'json'

OutputValues = {} 
a = "Time"
OutputValues[a] = "00:00"
b = "SoldierDeaths"
OutputValues[b] = 0

DeathCount = 0 
function AddDeathCount()
	DeathCount = DeathCount + 1
end

function GetTime(fTime)
	iTime = math.floor(Time())
	Minutes = DoubleDigits(math.floor(iTime/60))
	Seconds = DoubleDigits(iTime - Minutes*60)

	print(Minutes..":"..Seconds)
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