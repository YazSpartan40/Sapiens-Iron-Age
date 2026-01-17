local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec3xMat3 = mjm.vec3xMat3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate

local locale = mjrequire "common/locale"
local resource = mjrequire "common/resource"
local actionSequence = mjrequire "common/actionSequence"
local skill = mjrequire "common/skill"
local tool = mjrequire "common/tool"
local constructable = mjrequire "common/constructable"
local action = mjrequire "common/action"
local craftAreaGroup = mjrequire "common/craftAreaGroup"

local mod = { loadOrder = 2 }

function mod:onload(craftable)
    local prevLoad = craftable.load
    craftable.load = function(craftable_, gameObject, flora)
        prevLoad(craftable_, gameObject, flora)

        local ironSpeedMultiplier = 1.8
        local ironDamageMultiplier = 1.8
        local ironDurabilityMultiplier = 6.0
        
        local actionSequenceRepeatCountSmelting = 31
        local cookingStickRotationOffset = mat3Rotate(mat3Identity, math.pi * 0.25, vec3(0.0,1.0,0.0))
        local cookingStickRotation = mat3Rotate(mat3Identity, -math.pi + math.pi * 0.25, vec3(0.0,1.0,0.0))

        craftable:addCraftable("ironIngot", {
            name = locale:get("craftable_ironIngot"),
            plural = locale:get("craftable_ironIngot_plural"),
            summary = locale:get("craftable_ironIngot_summary"),
            iconGameObjectType = gameObject.typeIndexMap["ironIngot"],
            classification = constructable.classifications.craft.index,
            disabledUntilCraftableResearched = true,
            buildSequence = craftable:createStandardBuildSequence(actionSequence.types.smeltMetal.index, tool.types.crucible.index, actionSequenceRepeatCountSmelting),
            inProgressBuildModel = "craftCrucible",
            outputObjectInfo = {
                objectTypesArray = {
                    gameObject.typeIndexMap.ironIngot,
                    gameObject.typeIndexMap.ironIngot,
                    gameObject.typeIndexMap.ironIngot,
                }
            },
            skills = { required = skill.types.blacksmithing.index },
            requiredResources = {{
                type = resource.types.ironOre.index,
                count = 3,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                    duration = 15.0,
                    durationWithoutSkill = 30.0,
                }
            }},
            requiredTools = { tool.types.crucible.index },
            requiredCraftAreaGroups = { craftAreaGroup.types.kiln.index },
            dontPickUpRequiredTool = true,
            temporaryToolObjectType = gameObject.typeIndexMap.stick,
            temporaryToolOffset = vec3xMat3(vec3(-0.35,0.0,0.0), cookingStickRotationOffset),
            temporaryToolRotation = cookingStickRotation,
        })

        -- Tool heads with addGameObjectInfo (creates game objects + craftables)
        craftable:addCraftable("ironAxehead", {
            name = locale:get("craftable_ironAxehead"),
            plural = locale:get("craftable_ironAxehead_plural"),
            summary = locale:get("craftable_ironAxehead_summary"),
            classification = constructable.classifications.craft.index,
            addGameObjectInfo = {
                modelName = "ironAxeHead",  -- Direct custom model (ironAxeHead.glb)
                resourceTypeIndex = resource.types.ironAxehead.index,
                toolUsages = {
                    [tool.types.treeChop.index] = {
                        [tool.propertyTypes.speed.index] = ironSpeedMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                    [tool.types.dig.index] = {
                        [tool.propertyTypes.speed.index] = ironSpeedMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                },
            },
            buildSequence = craftable.smithingSequence,
            inProgressBuildModel = "craftSmith",
            skills = { required = skill.types.blacksmithing.index },
            requiredResources = {{
                type = resource.types.ironIngot.index,
                count = 1,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                    duration = 15.0,
                    durationWithoutSkill = 30.0,
                }
            }},
            requiredTools = { tool.types.hammering.index },
            requiredCraftAreaGroups = { craftAreaGroup.types.kiln.index },
        })

        craftable:addCraftable("ironKnife", {
            name = locale:get("craftable_ironKnife"),
            plural = locale:get("craftable_ironKnife_plural"),
            summary = locale:get("craftable_ironKnife_summary"),
            classification = constructable.classifications.craft.index,
            addGameObjectInfo = {
                modelName = "ironKnife",  -- Direct custom model (uses remap from metalKnife)
                resourceTypeIndex = resource.types.ironKnife.index,
                toolUsages = {
                    [tool.types.carving.index] = {
                        [tool.propertyTypes.speed.index] = ironSpeedMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                    [tool.types.butcher.index] = {
                        [tool.propertyTypes.speed.index] = ironSpeedMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                    [tool.types.weaponKnife.index] = {
                        [tool.propertyTypes.damage.index] = ironDamageMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                },
            },
            buildSequence = craftable.smithingSequence,
            inProgressBuildModel = "craftSmith",
            skills = { required = skill.types.blacksmithing.index },
            requiredResources = {{
                type = resource.types.ironIngot.index,
                count = 1,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                    duration = 15.0,
                    durationWithoutSkill = 30.0,
                }
            }},
            requiredTools = { tool.types.hammering.index },
            requiredCraftAreaGroups = { craftAreaGroup.types.kiln.index },
        })

        craftable:addCraftable("ironChisel", {
            name = locale:get("craftable_ironChisel"),
            plural = locale:get("craftable_ironChisel_plural"),
            summary = locale:get("craftable_ironChisel_summary"),
            classification = constructable.classifications.craft.index,
            addGameObjectInfo = {
                modelName = "ironChisel",  -- Direct custom model (uses remap from metalChisel)
                resourceTypeIndex = resource.types.ironChisel.index,
                toolUsages = {
                    [tool.types.carving.index] = {
                        [tool.propertyTypes.speed.index] = ironSpeedMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                },
            },
            buildSequence = craftable.smithingSequence,
            inProgressBuildModel = "craftSmith",
            skills = { required = skill.types.blacksmithing.index },
            requiredResources = {{
                type = resource.types.ironIngot.index,
                count = 1,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                    duration = 15.0,
                    durationWithoutSkill = 30.0,
                }
            }},
            requiredTools = { tool.types.hammering.index },
            requiredCraftAreaGroups = { craftAreaGroup.types.kiln.index },
        })

        craftable:addCraftable("ironSpearhead", {
            name = locale:get("craftable_ironSpearhead"),
            plural = locale:get("craftable_ironSpearhead_plural"),
            summary = locale:get("craftable_ironSpearhead_summary"),
            classification = constructable.classifications.craft.index,
            addGameObjectInfo = {
                modelName = "ironSpearHead",  -- Direct custom model (ironSpearHead.glb)
                resourceTypeIndex = resource.types.ironSpearhead.index,
            },
            buildSequence = craftable.smithingSequence,
            inProgressBuildModel = "craftSmith",
            skills = { required = skill.types.blacksmithing.index },
            requiredResources = {{
                type = resource.types.ironIngot.index,
                count = 1,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                    duration = 15.0,
                    durationWithoutSkill = 30.0,
                }
            }},
            requiredTools = { tool.types.hammering.index },
            requiredCraftAreaGroups = { craftAreaGroup.types.kiln.index },
            dontPickUpRequiredTool = true,
        })

        craftable:addCraftable("ironHammerhead", {
            name = locale:get("craftable_ironHammerhead"),
            plural = locale:get("craftable_ironHammerhead_plural"),
            summary = locale:get("craftable_ironHammerhead_summary"),
            classification = constructable.classifications.craft.index,
            addGameObjectInfo = {
                modelName = "ironHammerHead",  -- Direct custom model (ironHammerHead.glb)
                resourceTypeIndex = resource.types.ironHammerhead.index,
            },
            buildSequence = craftable.smithingSequence,
            inProgressBuildModel = "craftSmith",
            skills = { required = skill.types.blacksmithing.index },
            requiredResources = {{
                type = resource.types.ironIngot.index,
                count = 1,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                    duration = 15.0,
                    durationWithoutSkill = 30.0,
                }
            }},
            requiredTools = { tool.types.hammering.index },
            requiredCraftAreaGroups = { craftAreaGroup.types.kiln.index },
            dontPickUpRequiredTool = true,
        })

        craftable:addCraftable("ironPickaxehead", {
            name = locale:get("craftable_ironPickaxehead"),
            plural = locale:get("craftable_ironPickaxehead_plural"),
            summary = locale:get("craftable_ironPickaxehead_summary"),
            classification = constructable.classifications.craft.index,
            addGameObjectInfo = {
                modelName = "ironPickaxeHead",  -- Direct custom model (ironPickaxeHead.glb)
                resourceTypeIndex = resource.types.ironPickaxehead.index,
            },
            buildSequence = craftable.smithingSequence,
            inProgressBuildModel = "craftSmith",
            skills = { required = skill.types.blacksmithing.index },
            requiredResources = {{
                type = resource.types.ironIngot.index,
                count = 1,
                afterAction = {
                    actionTypeIndex = action.types.inspect.index,
                    duration = 15.0,
                    durationWithoutSkill = 30.0,
                }
            }},
            requiredTools = { tool.types.hammering.index },
            requiredCraftAreaGroups = { craftAreaGroup.types.kiln.index },
            dontPickUpRequiredTool = true,
        })

        -- Assembled tools with addGameObjectInfo
        -- Now using proper iron models with component assembly from modelPlaceholder
        craftable:addCraftable("ironAxe", {
            name = locale:get("craftable_ironAxe"),
            plural = locale:get("craftable_ironAxe_plural"),
            summary = locale:get("craftable_ironAxe_summary"),
            iconGameObjectType = gameObject.typeIndexMap["ironAxe"],
            classification = constructable.classifications.craft.index,
            disabledUntilCraftableResearched = true,
            addGameObjectInfo = {
                modelName = "ironAxe",  -- CRITICAL: Uses iron component assembly from modelPlaceholder
                resourceTypeIndex = resource.types.ironAxe.index,
                preservesConstructionObjects = true,
                toolUsages = {
                    [tool.types.treeChop.index] = {
                        [tool.propertyTypes.speed.index] = 2.0 * ironSpeedMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                },
            },
            buildSequence = craftable:createStandardBuildSequence(actionSequence.types.toolAssembly.index, nil),
            inProgressBuildModel = "ironAxeBuild",  -- CRITICAL: Uses iron build model from modelPlaceholder
            outputObjectInfo = {
                objectTypesArray = { gameObject.typeIndexMap.ironAxe }
            },
            skills = { required = skill.types.toolAssembly.index },
            requiredResources = {
                { type = resource.types.ironAxehead.index, count = 1 },
                { type = resource.types.branch.index, count = 1 },
                { type = resource.types.flaxTwine.index, count = 1 },
            },
        })

        craftable:addCraftable("ironSpear", {
            name = locale:get("craftable_ironSpear"),
            plural = locale:get("craftable_ironSpear_plural"),
            summary = locale:get("craftable_ironSpear_summary"),
            iconGameObjectType = gameObject.typeIndexMap["ironSpear"],
            classification = constructable.classifications.craft.index,
            disabledUntilCraftableResearched = true,
            addGameObjectInfo = {
                modelName = "ironSpear",  -- CRITICAL: Uses iron component assembly from modelPlaceholder
                resourceTypeIndex = resource.types.ironSpear.index,
                preservesConstructionObjects = true,
                toolUsages = {
                    [tool.types.weaponSpear.index] = {
                        [tool.propertyTypes.damage.index] = 2.0 * ironDamageMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                },
            },
            buildSequence = craftable:createStandardBuildSequence(actionSequence.types.toolAssembly.index, nil),
            inProgressBuildModel = "ironSpearBuild",  -- CRITICAL: Uses iron build model from modelPlaceholder
            outputObjectInfo = {
                objectTypesArray = { gameObject.typeIndexMap.ironSpear }
            },
            skills = { required = skill.types.toolAssembly.index },
            requiredResources = {
                { type = resource.types.ironSpearhead.index, count = 1 },
                { type = resource.types.branch.index, count = 1 },
                { type = resource.types.flaxTwine.index, count = 1 },
            },
        })

        craftable:addCraftable("ironPickaxe", {
            name = locale:get("craftable_ironPickaxe"),
            plural = locale:get("craftable_ironPickaxe_plural"),
            summary = locale:get("craftable_ironPickaxe_summary"),
            iconGameObjectType = gameObject.typeIndexMap["ironPickaxe"],
            classification = constructable.classifications.craft.index,
            disabledUntilCraftableResearched = true,
            addGameObjectInfo = {
                modelName = "ironPickaxe",  -- CRITICAL: Uses iron component assembly from modelPlaceholder
                resourceTypeIndex = resource.types.ironPickaxe.index,
                preservesConstructionObjects = true,
                toolUsages = {
                    [tool.types.mine.index] = {
                        [tool.propertyTypes.speed.index] = 2.0 * ironSpeedMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                },
            },
            buildSequence = craftable:createStandardBuildSequence(actionSequence.types.toolAssembly.index, nil),
            inProgressBuildModel = "ironPickaxeBuild",  -- CRITICAL: Uses iron build model from modelPlaceholder
            outputObjectInfo = {
                objectTypesArray = { gameObject.typeIndexMap.ironPickaxe }
            },
            skills = { required = skill.types.toolAssembly.index },
            requiredResources = {
                { type = resource.types.ironPickaxehead.index, count = 1 },
                { type = resource.types.branch.index, count = 1 },
                { type = resource.types.flaxTwine.index, count = 1 },
            },
        })

        craftable:addCraftable("ironHammer", {
            name = locale:get("craftable_ironHammer"),
            plural = locale:get("craftable_ironHammer_plural"),
            summary = locale:get("craftable_ironHammer_summary"),
            iconGameObjectType = gameObject.typeIndexMap["ironHammer"],
            classification = constructable.classifications.craft.index,
            disabledUntilCraftableResearched = true,
            addGameObjectInfo = {
                modelName = "ironHammer",  -- CRITICAL: Uses iron component assembly from modelPlaceholder
                resourceTypeIndex = resource.types.ironHammer.index,
                preservesConstructionObjects = true,
                toolUsages = {
                    [tool.types.hammering.index] = {
                        [tool.propertyTypes.speed.index] = 2.0 * ironSpeedMultiplier,
                        [tool.propertyTypes.durability.index] = ironDurabilityMultiplier,
                    },
                },
            },
            buildSequence = craftable:createStandardBuildSequence(actionSequence.types.toolAssembly.index, nil),
            inProgressBuildModel = "ironHammerBuild",  -- Custom iron build from modelPlaceholder
            outputObjectInfo = {
                objectTypesArray = { gameObject.typeIndexMap.ironHammer }
            },
            skills = { required = skill.types.toolAssembly.index },
            requiredResources = {
                { type = resource.types.ironHammerhead.index, count = 1 },
                { type = resource.types.branch.index, count = 1 },
                { type = resource.types.flaxTwine.index, count = 1 },
            },
        })

        mj:log("Iron Age: All craftables registered (1.8x speed/damage, 6.0x durability) - using iron component assemblies")
    end
end

return mod
