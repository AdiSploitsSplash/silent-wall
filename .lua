shared.WB = false
	shared.Key = 't'
 
	game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(Key)
		if Key == shared.Key then
			shared.WB = not shared.WB
		end
	end)
 
	local mt = getrawmetatable(game)
	local nc = mt.__namecall
 
	setreadonly(mt, false)
 
	mt.__namecall = newcclosure(function(self, ...)
		local Method = getnamecallmethod()
		local Arguments = {...}
 
		if Method == 'FindPartOnRayWithIgnoreList' and shared.WB then
			table.insert(Arguments[2], game.GetService(game, 'Workspace').Map)
 
			return nc(self, unpack(Arguments))
		end
 
		return nc(self,...)
	end)
