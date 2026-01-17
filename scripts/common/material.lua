local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mix = mjm.mix

local mod = {
    loadOrder = 1,
}

function mod:onload(material)
    -- Iron metal: Cool dark steel-grey with blue tint (#6b7a85)
    -- More distinct from bronze - darker and cooler
    local ironMetalColor = vec3(0.42, 0.48, 0.52)
    mj:insertIndexed(material.types, material.mat("iron", ironMetalColor, 0.15, 1.0))

    -- Iron ore: rusty brown iron oxide color (improved from grayish to reddish-brown)
    local ironOreColor = vec3(0.5, 0.25, 0.15)  -- Rusty brown: more red, less green/blue
    mj:insertIndexed(material.types, material.mat("ironOre", ironOreColor, 0.45, 0.0))
    material.types.ironOre.metal = 0.0

    -- Terrain iron ore: use the same iron ore color so rock matches ore
    local terrainIronOreColor = mix(ironOreColor, vec3(0.5, 0.5, 0.5), 0.1)
    mj:insertIndexed(material.types, material.mat("terrain_ironOre", terrainIronOreColor, 0.45, 0.0))
    material.types.terrain_ironOre.materialB = {
        color = ironOreColor,
        roughness = 0.45,
        metal = 0.0
    }
    material.types.ironOre.materialB = {
        color = ironOreColor,
        roughness = 0.45,
        metal = 0.0
    }

    -- Charcoal material from merged Charcoal mod
    -- Deep black charcoal color - very dark grey/black
    -- RGB values close to 0 for deep black
    local charcoalColor = vec3(0.01, 0.01, 0.01) -- Very dark black
    mj:insertIndexed(material.types, material.mat("charcoal", charcoalColor, 0.9, 0.0))
    material.types.charcoal.metal = 0.0  -- Not metallic

    mj:log("Iron Age: Materials registered")
end

return mod
