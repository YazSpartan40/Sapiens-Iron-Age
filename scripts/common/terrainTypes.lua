-- Iron Ages: Replace greenstone rock terrain with iron ore terrain
local mod = { loadOrder = 1 }

function mod:onload(terrainTypes)
    mj:log("Iron Age: Remapping greenRock terrain to ironOre")
    
    local material = mjrequire "common/material"
    
    -- Find and replace greenRock terrain type
    if terrainTypes.baseTypes.greenRock then
        -- Create iron ore outputs (3 iron ores when mined, like copper/tin)
        terrainTypes.baseTypes.greenRock.digOutputs = {
            {
                objectKeyName = "ironOre",
                allowsOutputWhenVertexHasBeenFilled = true
            },
            {
                objectKeyName = "ironOre",
                allowsOutputWhenVertexHasBeenFilled = true
            },
            {
                objectKeyName = "ironOre",
                allowsOutputWhenVertexHasBeenFilled = true
            },
        }
        
        -- Update fill object to iron ore
        terrainTypes.baseTypes.greenRock.fillObjectTypeKey = "ironOre"
        
        -- Completely remove chiseling option (iron ore can only be mined)
        terrainTypes.baseTypes.greenRock.chiselOutputs = nil
        
        -- Update material to iron ore terrain material
        if material.types.terrain_ironOre then
            terrainTypes.baseTypes.greenRock.material = material.types.terrain_ironOre.index
        end
        
        -- Update the name
        terrainTypes.baseTypes.greenRock.name = "Iron Ore"
        
        mj:log("Iron Age: Successfully remapped greenRock terrain to ironOre outputs")
    else
        mj:warn("Iron Age: greenRock terrain type not found!")
    end
    
    return terrainTypes
end

return mod
