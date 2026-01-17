local fuel = mjrequire "common/fuel"
local resource = mjrequire "common/resource"

local mod = {
    loadOrder = 2,  -- Load after fuel system is initialized
}

function mod:onload(fuel_)
    mj:log("Iron Age: Adding charcoal fuel values")

    -- Add charcoal to campfire fuel group with 5x burn time (branches = 1.0, so charcoal = 5.0)
    if fuel_.fuelGroups.campfire and fuel_.fuelGroups.campfire.resources then
        fuel_.fuelGroups.campfire.resources[resource.types.charcoal.index] = {
            fuelAddition = 5.0,
        }
        mj:log("Iron Age: Added charcoal to campfire fuel group with 5.0 fuel addition")
    end

    -- Add charcoal to kiln fuel group with 5x burn time
    if fuel_.fuelGroups.kiln and fuel_.fuelGroups.kiln.resources then
        fuel_.fuelGroups.kiln.resources[resource.types.charcoal.index] = {
            fuelAddition = 5.0,
        }
        mj:log("Iron Age: Added charcoal to kiln fuel group with 5.0 fuel addition")
    end

    -- Add charcoal to litObject fuel group (for general burning objects)
    if fuel_.fuelGroups.litObject and fuel_.fuelGroups.litObject.resources then
        fuel_.fuelGroups.litObject.resources[resource.types.charcoal.index] = {
            fuelAddition = 5.0,
        }
        mj:log("Iron Age: Added charcoal to litObject fuel group with 5.0 fuel addition")
    end

    mj:log("Iron Age: Fuel integration complete")
end

return mod