--data.raw.module["speed-module"].effect = { speed = {bonus = 2}, consumption = {bonus = 4}}

--data.raw.item["wood"].stack_size = 1000

local list = {
["rocket-control-unit"] =				"rocket",
["low-density-structure"] =				"rocket",
["satellite"] = "rocket",
["nuclear-fuel"] =				"fuel-nuclear",
["uranium-fuel-cell"] = "fuel-one",
["coal"] = "fuel-one",
["solid-fuel"] = "fuel-one",
["wood"] = "fuel-two",
["rocket-fuel"] =				"fuel-three",
["Xplosive-fuel"] = "fuel-three",
["F1-fuel"] = "fuel-three",
["Panda-fuel"] = "fuel-four",
}

local function modify_stack_size(name, item, additional_multiplier)
	category = list[name]
	multiplier = 1
	if category == "rocket" then
		multiplier = settings.startup["rocket-part-multiplier"].value
		multiplier = multiplier*additional_multiplier
	elseif category == "fuel-nuclear" then
		multiplier = settings.startup["nuclear-fuel-multiplier"].value
		multiplier = multiplier*additional_multiplier
	elseif category == "fuel-one" then
		multiplier = settings.startup["fuel-with-50-multiplier"].value
		multiplier = multiplier*additional_multiplier
	elseif category == "fuel-two" then
		multiplier = settings.startup["fuel-with-100-multiplier"].value
		multiplier = multiplier*additional_multiplier
	elseif category == "fuel-three" then
		multiplier = settings.startup["fuel-with-10-multiplier"].value
		multiplier = multiplier*additional_multiplier
	elseif category == "fuel-four" then
		multiplier = settings.startup["fuel-with-20-multiplier"].value
		multiplier = multiplier*additional_multiplier
	end
	modified_size = multiplier * item.stack_size
	modified_size = math.max(math.floor(modified_size), 1)
	if item.stack_size > 0 then
		item.stack_size = modified_size
	end
	
end


for name, item in pairs(data.raw["item"]) do
	modify_stack_size(name, item, 1)
end