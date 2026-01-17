local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

local resource = mjrequire "common/resource"
local locale = mjrequire "common/locale"

local mod = {
    loadOrder = 1,
}

function mod:onload(gameObject)
    
    mj:log("Iron Age: Registering ironOre and ironIngot game objects")
    
    gameObject:addGameObjectsFromTable({
        -- Iron ore (remapped from greenstone rock)
        ironOre = {
            name = locale:get("object_ironOre"),
            plural = locale:get("object_ironOre_plural"),
            modelName = "ironOre",
            scale = 1.0,
            hasPhysics = true,
            allowsAnyInitialRotation = true,
            resourceTypeIndex = resource.types.ironOre.index,
            markerPositions = {
                { worldOffset = vec3(0.0, mj:mToP(0.2), 0.0) }
            },
            mass = 2.0,
            category = "resources",
        },
        
        -- Iron ingot
        ironIngot = {
            name = locale:get("object_ironIngot"),
            plural = locale:get("object_ironIngot_plural"),
            modelName = "ironIngot",
            scale = 1.0,
            hasPhysics = true,
            resourceTypeIndex = resource.types.ironIngot.index,
            markerPositions = {
                { worldOffset = vec3(0.0, mj:mToP(0.2), 0.0) }
            },
            mass = 2.0,
            category = "resources",
        },
        -- NOTE: Tool heads and assembled tools are NOT registered here!
        -- They are created by craftable.lua using addGameObjectInfo
        -- This matches Arsenic Bronze pattern
    })

    mj:log("Iron Age: Registered ironOre and ironIngot gameObjects (tools registered by craftable.lua)")
    
    return gameObject
end

return mod
