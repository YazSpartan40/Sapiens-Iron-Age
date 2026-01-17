local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate

local rng = mjrequire "common/randomNumberGenerator"
local typeMaps = mjrequire "common/typeMaps"
local locale = mjrequire "common/locale"
local resource = mjrequire "common/resource"

local mod = {
    loadOrder = 1,
}

mj:log("Iron Age: storage.lua loaded")

function mod:onload(storage)
    local gameObjectTypeIndexMap = typeMaps.types.gameObject

    -- Iron Ore Storage (separate storage type, like copperOre/tinOre)
    typeMaps:insert("storage", storage.types, {
        key = "ironOre",
        name = locale:get("storage_ironOre"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironOre,
        resources = {
            resource.types.ironOre.index,
        },
        storageBox = {
            size = vec3(0.4, 0.2, 0.4),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                local rotation = mat3Rotate(mat3Identity, randomValue * 6.28, vec3(0.0,1.0,0.0))
                return rotation
            end,
        },
        maxCarryCount = 4,
        maxCarryCountLimitedAbility = 2,
        maxCarryCountForRunning = 2,
        carryOffset = vec3(0.0, 0.1, 0.0),
        carryRotation = mat3Identity,
    })
    
    -- Iron Ingot Storage (separate storage type, matching vanilla ingot pattern)
    typeMaps:insert("storage", storage.types, {
        key = "ironIngot",
        name = locale:get("storage_ironIngot"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironIngot,
        resources = {
            resource.types.ironIngot.index,
        },
        storageBox = {
            size = vec3(0.5, 0.15, 0.2),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                local rotation = mat3Rotate(mat3Identity, randomValue * 0.2 - 0.1, vec3(0.0,1.0,0.0))
                return rotation
            end,
            dontRotateToFitBelowSurface = true,
        },
        maxCarryCount = 1,
        maxCarryCountLimitedAbility = 1,
        maxCarryCountForRunning = 0,
        carryOffset = vec3(-0.02,0.15,0.04),
        carryRotation = mat3Rotate(mat3Rotate(mat3Rotate(mat3Identity, 1.0, vec3(0.0, 0.0, 1.0)), -0.5, vec3(0.0, 1.0, 0.0)), 0.3, vec3(1.0,0.0,0.0)),
    })
    
    mj:log("Iron Age: Created 2 custom storage types (ironOre, ironIngot)")
    
    -- Add iron tool heads to existing vanilla tool head storage types
    -- This allows them to stack with stone/flint/bronze tool heads
    
    -- Add ironSpearhead to existing "spearHead" storage type
    local spearHeadStorage = storage.types.spearHead
    if spearHeadStorage then
        table.insert(spearHeadStorage.resources, resource.types.ironSpearhead.index)
        storage.typesByResource[resource.types.ironSpearhead.index] = spearHeadStorage.index
        mj:log("Iron Age: Added ironSpearhead to spearHead storage")
    end
    
    -- Add ironAxehead to existing "axeHead" storage type
    local axeHeadStorage = storage.types.axeHead
    if axeHeadStorage then
        table.insert(axeHeadStorage.resources, resource.types.ironAxehead.index)
        storage.typesByResource[resource.types.ironAxehead.index] = axeHeadStorage.index
        mj:log("Iron Age: Added ironAxehead to axeHead storage")
    end
    
    -- Add ironPickaxehead to existing "pickaxeHead" storage type
    local pickaxeHeadStorage = storage.types.pickaxeHead
    if pickaxeHeadStorage then
        table.insert(pickaxeHeadStorage.resources, resource.types.ironPickaxehead.index)
        storage.typesByResource[resource.types.ironPickaxehead.index] = pickaxeHeadStorage.index
        mj:log("Iron Age: Added ironPickaxehead to pickaxeHead storage")
    end
    
    -- Add ironKnife to existing "knife" storage type
    local knifeStorage = storage.types.knife
    if knifeStorage then
        table.insert(knifeStorage.resources, resource.types.ironKnife.index)
        storage.typesByResource[resource.types.ironKnife.index] = knifeStorage.index
        mj:log("Iron Age: Added ironKnife to knife storage")
    end
    
    -- Add ironHammerhead to existing "hammerHead" storage type
    local hammerHeadStorage = storage.types.hammerHead
    if hammerHeadStorage then
        table.insert(hammerHeadStorage.resources, resource.types.ironHammerhead.index)
        storage.typesByResource[resource.types.ironHammerhead.index] = hammerHeadStorage.index
        mj:log("Iron Age: Added ironHammerhead to hammerHead storage")
    end
    
    -- Add ironChisel to existing "chisel" storage type
    local chiselStorage = storage.types.chisel
    if chiselStorage then
        table.insert(chiselStorage.resources, resource.types.ironChisel.index)
        storage.typesByResource[resource.types.ironChisel.index] = chiselStorage.index
        mj:log("Iron Age: Added ironChisel to chisel storage")
    end
    
    -- Add assembled iron tools to existing vanilla tool storage types
    -- This allows them to stack with stone/flint/bronze assembled tools
    
    -- Add ironSpear to existing "spear" storage type
    local spearStorage = storage.types.spear
    if spearStorage then
        table.insert(spearStorage.resources, resource.types.ironSpear.index)
        storage.typesByResource[resource.types.ironSpear.index] = spearStorage.index
        mj:log("Iron Age: Added ironSpear to spear storage")
    end
    
    -- Add ironAxe to existing "hatchet" storage type
    local hatchetStorage = storage.types.hatchet
    if hatchetStorage then
        table.insert(hatchetStorage.resources, resource.types.ironAxe.index)
        storage.typesByResource[resource.types.ironAxe.index] = hatchetStorage.index
        mj:log("Iron Age: Added ironAxe to hatchet storage")
    end
    
    -- Add ironPickaxe to existing "pickaxe" storage type
    local pickaxeStorage = storage.types.pickaxe
    if pickaxeStorage then
        table.insert(pickaxeStorage.resources, resource.types.ironPickaxe.index)
        storage.typesByResource[resource.types.ironPickaxe.index] = pickaxeStorage.index
        mj:log("Iron Age: Added ironPickaxe to pickaxe storage")
    end
    
    -- Add ironHammer to existing "hammer" storage type
    local hammerStorage = storage.types.hammer
    if hammerStorage then
        table.insert(hammerStorage.resources, resource.types.ironHammer.index)
        storage.typesByResource[resource.types.ironHammer.index] = hammerStorage.index
        mj:log("Iron Age: Added ironHammer to hammer storage")
    end

    -- Charcoal storage from merged Charcoal mod
    typeMaps:insert("storage", storage.types, {
        key = "charcoal",
        name = locale:get("storage_charcoal"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.charcoal,
        resources = {
            resource.types.charcoal.index,
        },
        storageBox = {
            size = vec3(0.3, 0.2, 0.3),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                local rotation = mat3Rotate(mat3Identity, randomValue * 6.282, vec3(0.0,1.0,0.0))
                return rotation
            end,
        },
        maxCarryCount = 4,
        maxCarryCountLimitedAbility = 2,
        maxCarryCountForRunning = 1,
        carryOffset = vec3(0.0, 0.1, 0.0),
    })

    mj:log("Iron Age: All iron tools added to vanilla storage types (10 items remapped)")
end

return mod
