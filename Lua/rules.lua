function codecheck(unitid,ox,oy,cdir_,ignore_end_)
	local unit = mmf.newObject(unitid)
	local ux,uy = unit.values[XPOS],unit.values[YPOS]
	local x = unit.values[XPOS] + ox
	local y = unit.values[YPOS] + oy
	local result = {}
	local letters = false
	local justletters = false
	local cdir = cdir_ or 0
	
	local ignore_end = false
	if (ignore_end_ ~= nil) then
		ignore_end = ignore_end_
	end

	if (cdir == 0) then
		MF_alert("CODECHECK - CDIR == 0 - why??")
	end
	local tileid = x + y * roomsizex
	
	if (unitmap[tileid] ~= nil) then
		for i,b in ipairs(unitmap[tileid]) do
			local v = mmf.newObject(b)
			local w = 1
			
			if (v.values[TYPE] ~= 5) then
				if (v.strings[UNITTYPE] == "text") then
					--@Turning text: reinterpret the meaning of the turning text by replacing its parsed name with an existing name
					local v_name = get_turning_text_interpretation(b)
					--@ Turning text

					table.insert(result, {{b}, w, v_name, v.values[TYPE], cdir})
				else
					if (#wordunits > 0) then
						for c,d in ipairs(wordunits) do
							if (b == d[1]) and testcond(d[2],d[1]) then
								table.insert(result, {{b}, w, v.strings[UNITNAME], v.values[TYPE], cdir})
							end
						end
					end
				end
			else
				justletters = true
			end
		end
	end
	
	if (letterunits_map[tileid] ~= nil) then
		for i,v in ipairs(letterunits_map[tileid]) do
			local unitids = v[7]
			local width = v[6]
			local word = v[1]
			local wtype = v[2]
			local dir = v[5]
			
			if (string.len(word) > 5) and (string.sub(word, 1, 5) == "text_") then
                word = string.sub(v[1], 6)
			end
			
			local valid = true
			if ignore_end and ((x ~= v[3]) or (y ~= v[4])) and (width > 1) then
				valid = false
			end
			
			if (cdir ~= 0) and (width > 1) then
				if ((cdir == 1) and (ux > v[3]) and (ux < v[3] + width)) or ((cdir == 2) and (uy > v[4]) and (uy < v[4] + width)) then
					valid = false
				end
			end
			
			--MF_alert(word .. ", " .. tostring(valid) .. ", " .. tostring(dir) .. ", " .. tostring(cdir))
			
			if (dir == cdir) and valid then
				table.insert(result, {unitids, width, word, wtype, dir})
				letters = true
			end
		end
	end
	
	return result,letters,justletters
end