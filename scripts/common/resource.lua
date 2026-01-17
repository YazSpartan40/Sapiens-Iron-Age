local typeMaps = mjrequire "common/typeMaps"
local locale = mjrequire "common/locale"

local mod = {
    loadOrder = 1,
}

function mod:onload(resource)
    
    local gameObjectTypeIndexMap = typeMaps.types.gameObject
    
    -- Iron ore
    typeMaps:insert("resource", resource.types, {
        key = "ironOre",
        name = locale:get("resource_ironOre"),
        plural = locale:get("resource_ironOre_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironOre,
        impactCausesMajorInjury = true,
        tradeBatchSize = 5,
        tradeValue = 12,
    })
    
    -- Iron ingot
    typeMaps:insert("resource", resource.types, {
        key = "ironIngot",
        name = locale:get("resource_ironIngot"),
        plural = locale:get("resource_ironIngot_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironIngot,
        tradeBatchSize = 10,
        tradeValue = 35,
    })
    
    -- Tool heads
    typeMaps:insert("resource", resource.types, {
        key = "ironAxehead",
        name = locale:get("resource_ironAxehead"),
        plural = locale:get("resource_ironAxehead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironAxehead,
        tradeBatchSize = 5,
        tradeValue = 40,
    })
    
    typeMaps:insert("resource", resource.types, {
        key = "ironSpearhead",
        name = locale:get("resource_ironSpearhead"),
        plural = locale:get("resource_ironSpearhead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironSpearhead,
        tradeBatchSize = 5,
        tradeValue = 40,
    })
    
    typeMaps:insert("resource", resource.types, {
        key = "ironPickaxehead",
        name = locale:get("resource_ironPickaxehead"),
        plural = locale:get("resource_ironPickaxehead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironPickaxehead,
        tradeBatchSize = 5,
        tradeValue = 40,
    })
    
    typeMaps:insert("resource", resource.types, {
        key = "ironHammerhead",
        name = locale:get("resource_ironHammerhead"),
        plural = locale:get("resource_ironHammerhead_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironHammerhead,
        tradeBatchSize = 5,
        tradeValue = 40,
    })
    
    typeMaps:insert("resource", resource.types, {
        key = "ironKnife",
        name = locale:get("resource_ironKnife"),
        plural = locale:get("resource_ironKnife_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironKnife,
        tradeBatchSize = 5,
        tradeValue = 40,
    })
    
    typeMaps:insert("resource", resource.types, {
        key = "ironChisel",
        name = locale:get("resource_ironChisel"),
        plural = locale:get("resource_ironChisel_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironChisel,
        tradeBatchSize = 5,
        tradeValue = 40,
    })
    
    -- Assembled tools
    typeMaps:insert("resource", resource.types, {
        key = "ironAxe",
        name = locale:get("resource_ironAxe"),
        plural = locale:get("resource_ironAxe_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironAxe,
        tradeBatchSize = 3,
        tradeValue = 80,
    })
    
    typeMaps:insert("resource", resource.types, {
        key = "ironSpear",
        name = locale:get("resource_ironSpear"),
        plural = locale:get("resource_ironSpear_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironSpear,
        tradeBatchSize = 3,
        tradeValue = 80,
    })
    
    typeMaps:insert("resource", resource.types, {
        key = "ironPickaxe",
        name = locale:get("resource_ironPickaxe"),
        plural = locale:get("resource_ironPickaxe_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironPickaxe,
        tradeBatchSize = 3,
        tradeValue = 80,
    })
    
    typeMaps:insert("resource", resource.types, {
        key = "ironHammer",
        name = locale:get("resource_ironHammer"),
        plural = locale:get("resource_ironHammer_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.ironHammer,
        tradeBatchSize = 3,
        tradeValue = 80,
    })
    
    mj:log("Iron Age: Resources registered")
end

return mod
