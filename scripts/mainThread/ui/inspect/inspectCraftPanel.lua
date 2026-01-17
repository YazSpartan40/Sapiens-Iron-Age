local mod = {
    loadOrder = 1,
}

function mod:onload(inspectCraftPanel)
    
    -- Truth #12: Types accessed safely in onload()
    local constructable = mjrequire "common/constructable"
    local gameObject = mjrequire "common/gameObject"
    
    -- Add tool heads and small tools to kiln craftables array
    local kilnCraftables = inspectCraftPanel.itemLists[gameObject.typeIndexMap.brickKiln]
    
    if kilnCraftables then
        -- Add kiln items (smelting)
        table.insert(kilnCraftables, constructable.types.ironIngot.index)
        table.insert(kilnCraftables, constructable.types.ironAxehead.index)
        table.insert(kilnCraftables, constructable.types.ironKnife.index)
        table.insert(kilnCraftables, constructable.types.ironChisel.index)
        table.insert(kilnCraftables, constructable.types.ironSpearhead.index)
        table.insert(kilnCraftables, constructable.types.ironPickaxehead.index)
        table.insert(kilnCraftables, constructable.types.ironHammerhead.index)
        
        -- Charcoal craftables from merged Charcoal mod
        table.insert(kilnCraftables, constructable.types.charcoalFromBranches.index)
        table.insert(kilnCraftables, constructable.types.charcoalFromLog.index)
        
        mj:log("Iron Age: Added 7 craftables to kiln itemLists")
    else
        mj:warn("Iron Age: Could not find brickKiln in itemLists")
    end

    -- Add charcoal craftables to campfire menu from merged Charcoal mod
    local campfireCraftables = inspectCraftPanel.itemLists[gameObject.typeIndexMap.campfire]

    if campfireCraftables then
        -- Add the charcoal recipes
        table.insert(campfireCraftables, constructable.types.charcoalFromBranches.index)
        table.insert(campfireCraftables, constructable.types.charcoalFromLog.index)

        mj:log("Iron Age: Added 2 charcoal recipes to campfire menu")
    else
        mj:warn("Iron Age: Could not find campfire in itemLists")
    end

    -- Add assembled tools to craftArea itemLists
    local craftAreaCraftables = inspectCraftPanel.itemLists[gameObject.typeIndexMap.craftArea]
    
    if craftAreaCraftables then
        -- Add craft area items (assembly)
        table.insert(craftAreaCraftables, constructable.types.ironAxe.index)
        table.insert(craftAreaCraftables, constructable.types.ironSpear.index)
        table.insert(craftAreaCraftables, constructable.types.ironPickaxe.index)
        table.insert(craftAreaCraftables, constructable.types.ironHammer.index)
        
        mj:log("Iron Age: Added 4 assembled tools to craftArea itemLists")
    else
        mj:warn("Iron Age: Could not find craftArea in itemLists")
    end
    
    return inspectCraftPanel
end

return mod
