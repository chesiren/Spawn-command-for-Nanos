Package:RequirePackage("NanosWorldWeapons")

function SplitString (inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

Server:on("Console", function(text)
	local command = SplitString(text)
	
	-- invalid command
	if command[1] == nil then return end
	if string.sub(command[1], 1, 5) ~= "spawn" then return end
	
	
	-- set model
	local model = "NanosWorld::SM_Error"
	if command[2] == nil then
		Package:Log("Warning: Model is nil, using default")
		
		if command[1] == "spawn_prop" then
			model = "NanosWorld::SM_Cube"
		elseif command[1] == "spawn_bot" then
			model = "NanosWorld::SK_Mannequin"
		elseif command[1] == "spawn_item" then
			model = "NanosWorld::BP_Grabable_Torch"
		elseif command[1] == "spawn_vehicle" then
			model = "NanosWorld::BP_Vehicle_SUV"
		elseif command[1] == "spawn_weapon" then
			model = "AK47"
		end
	else
		if command[1] == "spawn_weapon" then
			model = command[2]
		else
			model = "NanosWorld::"..command[2]
		end
	end
	
	-- set position
	if command[3] == nil then command[3] = 0 end 
	if command[4] == nil then command[4] = 0 end 
	if command[5] == nil then command[5] = 200 end 
	
	local position = Vector(tonumber(command[3]), tonumber(command[4]), tonumber(command[5]))
	
	-- set rotation
	for i = 1, 3 do 
		if command[5+i] == nil then command[5+i] = 0 end 
	end
	
	local rotation = Rotator(tonumber(command[6]), tonumber(command[7]), tonumber(command[8]))
	
	-- create object
	if command[1] == "spawn_prop" then
		Prop(position, rotation, model)
	elseif command[1] == "spawn_bot" then
		Character(position, rotation, model)
	elseif command[1] == "spawn_item" then
		Item(position, rotation, model)
	elseif command[1] == "spawn_vehicle" then
		Vehicle(position, rotation, model)
	elseif command[1] == "spawn_weapon" then
		if model == "AK47" then
			NanosWorldWeapons.AK47(position, rotation)
		elseif model == "AK74U" then
			NanosWorldWeapons.AK74U(position, rotation)
		elseif model == "GE36" then
			NanosWorldWeapons.GE36(position, rotation)
		elseif model == "Glock" then
			NanosWorldWeapons.Glock(position, rotation)
		elseif model == "DesertEagle" then
			NanosWorldWeapons.DesertEagle(position, rotation)
		elseif model == "AR4" then
			NanosWorldWeapons.AR4(position, rotation)
		elseif model == "Moss500" then
			NanosWorldWeapons.Moss500(position, rotation)
		elseif model == "AP5" then
			NanosWorldWeapons.AP5(position, rotation)
		elseif model == "SMG11" then
			NanosWorldWeapons.SMG11(position, rotation)
		end
	end
end)