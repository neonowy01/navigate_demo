function Activate()
	if GetHMDAvatar == nil
		then 
			thisEntity:SetParent(Entities:FindByName(nil, "beginnerui_anchor"), "")
	end
end