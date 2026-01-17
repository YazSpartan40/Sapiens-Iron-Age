-- Iron Ages Mod: modelPlaceholder.lua
-- Defines component assembly for iron tools (branch + iron toolhead + twine)

local mod = {
    loadOrder = 1,
}

function mod:onload(modelPlaceholder)
    local resource = mjrequire "common/resource"
    
    -- Shadow the addModels function to add our custom component assemblies
    local super_addModels = modelPlaceholder.addModels
    
    function modelPlaceholder:addModels()
        super_addModels(self)  -- Call vanilla first
        
        mj:log("Iron Age: Adding custom modelPlaceholder definitions")
        
        -- IRON AXE (Hatchet) - Component Assembly
        self:addModel("ironAxe", {
            {
                key = "branch_1",
                defaultModelName = "woodenPoleShort_birch",  -- SHORT pole for axes
                resourceTypeIndex = resource.types.branch.index,
                placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return self:getModelIndexForStandardRemaps(placeholderInfo, self.shortPoleBranchRemaps[objectTypeIndex], placeholderContext)  -- SHORT pole remaps
                end,
            },
            {
                key = "flintAxeHead_1",  -- Uses flint slot
                defaultModelName = "ironAxeHead",  -- But iron model
                resourceTypeIndex = resource.types.ironAxehead.index,
            },
            {
                key = "flaxTwine_1",
                defaultModelName = "flaxTwineBinding",
                resourceTypeIndex = resource.types.flaxTwine.index,
                defaultModelShouldOverrideResourceObject = true,
            },
        },
        {
            ironAxehead = "flintAxeHead"  -- Resource remap
        })
        
        self:addModel("ironAxeBuild", {
            {
                key = "branch_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.branch.index,
            },
            {
                key = "flintAxeHead_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.ironAxehead.index,
            },
            {
                key = "flaxTwine_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.flaxTwine.index,
            },
        })
        
        -- IRON SPEAR - Component Assembly
        self:addModel("ironSpear", {
            {
                key = "branch_1",
                defaultModelName = "woodenPole_birch",  -- LONG pole for spears (correct!)
                resourceTypeIndex = resource.types.branch.index,
                placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return self:getModelIndexForStandardRemaps(placeholderInfo, self.standardLengthPoleBranchRemaps[objectTypeIndex], placeholderContext)  -- LONG pole remaps
                end,
            },
            {
                key = "flintSpearHead_1",  -- Uses flint slot (stone conflicts with arsenic)
                defaultModelName = "ironSpearHead",  -- Custom iron model
                resourceTypeIndex = resource.types.ironSpearhead.index,
            },
            {
                key = "flaxTwine_1",
                defaultModelName = "flaxTwineBinding",
                resourceTypeIndex = resource.types.flaxTwine.index,
                defaultModelShouldOverrideResourceObject = true,
            },
        },
        {
            ironSpearhead = "flintSpearHead"  -- Resource remap (changed to flint to avoid arsenic conflict)
        })
        
        self:addModel("ironSpearBuild", {
            {
                key = "branch_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.branch.index,
            },
            {
                key = "flintSpearHead_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.ironSpearhead.index,
            },
            {
                key = "flaxTwine_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.flaxTwine.index,
            },
        })
        
        -- IRON PICKAXE - Component Assembly
        self:addModel("ironPickaxe", {
            {
                key = "branch_1",
                defaultModelName = "woodenPoleShort_birch",  -- SHORT pole for pickaxes
                resourceTypeIndex = resource.types.branch.index,
                placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return self:getModelIndexForStandardRemaps(placeholderInfo, self.shortPoleBranchRemaps[objectTypeIndex], placeholderContext)  -- SHORT pole remaps
                end,
            },
            {
                key = "flintPickaxeHead_1",  -- Uses flint slot (stone conflicts with arsenic)
                defaultModelName = "ironPickaxeHead",  -- Custom iron model
                resourceTypeIndex = resource.types.ironPickaxehead.index,
            },
            {
                key = "flaxTwine_1",
                defaultModelName = "flaxTwineBinding",
                resourceTypeIndex = resource.types.flaxTwine.index,
                defaultModelShouldOverrideResourceObject = true,
            },
        },
        {
            ironPickaxehead = "flintPickaxeHead"  -- Resource remap (changed to flint to avoid arsenic conflict)
        })
        
        self:addModel("ironPickaxeBuild", {
            {
                key = "branch_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.branch.index,
            },
            {
                key = "flintPickaxeHead_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.ironPickaxehead.index,
            },
            {
                key = "flaxTwine_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.flaxTwine.index,
            },
        })
        
        -- IRON HAMMER - Component Assembly
        self:addModel("ironHammer", {
            {
                key = "branch_1",
                defaultModelName = "woodenPoleShort_birch",  -- SHORT pole for hammers
                resourceTypeIndex = resource.types.branch.index,
                placeholderModelIndexForObjectTypeFunction = function(placeholderInfo, objectTypeIndex, placeholderContext)
                    return self:getModelIndexForStandardRemaps(placeholderInfo, self.shortPoleBranchRemaps[objectTypeIndex], placeholderContext)  -- SHORT pole remaps
                end,
            },
            {
                key = "stoneHammerHead_1",  -- Uses stone slot (like ironSpear uses stoneSpearHead_1)
                defaultModelName = "ironHammerHead",  -- Custom iron model
                resourceTypeIndex = resource.types.ironHammerhead.index,
            },
            {
                key = "flaxTwine_1",
                defaultModelName = "flaxTwineBinding",
                resourceTypeIndex = resource.types.flaxTwine.index,
                defaultModelShouldOverrideResourceObject = true,
            },
        },
        {
            ironHammerhead = "stoneHammerHead"  -- Resource remap (like ironSpear)
        })
        
        self:addModel("ironHammerBuild", {
            {
                key = "branch_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.branch.index,
            },
            {
                key = "stoneHammerHead_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.ironHammerhead.index,
            },
            {
                key = "flaxTwine_store",
                offsetToStorageBoxWalkableHeight = true,
                resourceTypeIndex = resource.types.flaxTwine.index,
            },
        })
        
        mj:log("Iron Age: modelPlaceholder definitions added (4 assembled tools + 4 build models)")
    end
end

return mod
