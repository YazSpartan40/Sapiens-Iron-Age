local resource = mjrequire "common/resource"
local skill = mjrequire "common/skill"
local order = mjrequire "common/order"
local tool = mjrequire "common/tool"

local mod = {
    loadOrder = 1,
}

function mod:onload(research)
    local prevLoad = research.load
    research.load = function(research_, gameObject_, constructable, flora)
        prevLoad(research_, gameObject_, constructable, flora)

        -- Iron Smelting research: discover by picking up iron ore
        local ironSmeltingResearchConfig = {
            resourceTypeIndexes = {
                resource.types.ironOre.index,
            },
            icon = skill.types.blacksmithing.icon,
            researchRequiredForVisibilityDiscoverySkillTypeIndexes = {
                skill.types.blacksmithing.index,
            },
            requiredToolTypeIndex = tool.types.crucible.index,
            orderTypeIndexesByBaseObjectTypeIndex = {},
            constructableTypeIndexesByBaseResourceTypeIndex = {
                [resource.types.ironOre.index] = constructable.types.ironIngot.index,
            },
        }

        -- Add ironOre pickup as research trigger if gameObject exists
        if gameObject_ and gameObject_.types and gameObject_.types.ironOre then
            ironSmeltingResearchConfig.orderTypeIndexesByBaseObjectTypeIndex[gameObject_.types.ironOre.index] = order.types.pickupObject.index
            mj:log("Iron Age: Mapped ironOre pickup to research trigger")
        end

        -- Register the ironSmelting research
        local ironSmeltingResearchIndex = research_:addResearch("ironSmelting", ironSmeltingResearchConfig)
        if ironSmeltingResearchIndex then
            research_:updateDerivedInfo(research_.types.ironSmelting)
            mj:log("Iron Age: ironSmelting research registered with index:", ironSmeltingResearchIndex)
        else
            mj:warn("Iron Age: Failed to register ironSmelting research")
        end

        -- Add iron tool heads to existing toolAssembly research
        if research_.types.toolAssembly then
            mj:log("Iron Age: Adding iron tool heads to toolAssembly research")
            mj:log("Iron Age: Adding iron tool heads to toolAssembly research")
            
            -- Add to constructableTypeIndexesByBaseResourceTypeIndex
            if not research_.types.toolAssembly.constructableTypeIndexesByBaseResourceTypeIndex then
                research_.types.toolAssembly.constructableTypeIndexesByBaseResourceTypeIndex = {}
            end
            research_.types.toolAssembly.constructableTypeIndexesByBaseResourceTypeIndex[resource.types.ironSpearhead.index] = constructable.types.ironSpear.index
            research_.types.toolAssembly.constructableTypeIndexesByBaseResourceTypeIndex[resource.types.ironAxehead.index] = constructable.types.ironAxe.index
            research_.types.toolAssembly.constructableTypeIndexesByBaseResourceTypeIndex[resource.types.ironPickaxehead.index] = constructable.types.ironPickaxe.index
            research_.types.toolAssembly.constructableTypeIndexesByBaseResourceTypeIndex[resource.types.ironHammerhead.index] = constructable.types.ironHammer.index
            
            -- Add to resourceTypeIndexes array
            if not research_.types.toolAssembly.resourceTypeIndexes then
                research_.types.toolAssembly.resourceTypeIndexes = {}
            end
            table.insert(research_.types.toolAssembly.resourceTypeIndexes, resource.types.ironSpearhead.index)
            table.insert(research_.types.toolAssembly.resourceTypeIndexes, resource.types.ironAxehead.index)
            table.insert(research_.types.toolAssembly.resourceTypeIndexes, resource.types.ironPickaxehead.index)
            table.insert(research_.types.toolAssembly.resourceTypeIndexes, resource.types.ironHammerhead.index)
            
            -- Add to orderTypeIndexesByBaseObjectTypeIndex for clickable discoveries
            if gameObject_ and gameObject_.types then
                if not research_.types.toolAssembly.orderTypeIndexesByBaseObjectTypeIndex then
                    research_.types.toolAssembly.orderTypeIndexesByBaseObjectTypeIndex = {}
                end
                if gameObject_.types.ironSpearhead then
                    research_.types.toolAssembly.orderTypeIndexesByBaseObjectTypeIndex[gameObject_.types.ironSpearhead.index] = order.types.pickupObject.index
                end
                if gameObject_.types.ironAxehead then
                    research_.types.toolAssembly.orderTypeIndexesByBaseObjectTypeIndex[gameObject_.types.ironAxehead.index] = order.types.pickupObject.index
                end
                if gameObject_.types.ironPickaxehead then
                    research_.types.toolAssembly.orderTypeIndexesByBaseObjectTypeIndex[gameObject_.types.ironPickaxehead.index] = order.types.pickupObject.index
                end
                if gameObject_.types.ironHammerhead then
                    research_.types.toolAssembly.orderTypeIndexesByBaseObjectTypeIndex[gameObject_.types.ironHammerhead.index] = order.types.pickupObject.index
                end
            end
            
            -- Update derived info after modifying existing research
            research_:updateDerivedInfo(research_.types.toolAssembly)
            mj:log("Iron Age: Tool assembly research updated")
        else
            mj:warn("Iron Age: toolAssembly research not found")
        end

        -- Charcoal research from merged Charcoal mod
        mj:log("Iron Age: Preparing charcoal making research registration")

        --[[
        mj:log("Iron Age: Registering charcoalMaking research")

        -- Verify campfireCooking skill exists
        if not skill.types.campfireCooking then
            mj:error("Iron Age: campfireCooking skill not found!")
            return
        end
        mj:log("Iron Age: Found campfireCooking skill with index:", skill.types.campfireCooking.index)

        -- Charcoal Making research - mimics campfireCooking pattern
        local charcoalMakingResearchConfig = {
            -- Does not teach a skill (campfireCooking already learned)
            -- skillTypeIndex = skill.types.campfireCooking.index,
            
            -- Map resources to production recipes (crafting them completes research and unlocks all)
            constructableTypeIndexesByBaseResourceTypeIndex = {
                [resource.types.branch.index] = constructable.types.charcoalFromBranches.index,
                [resource.types.log.index] = constructable.types.charcoalFromLog.index,
            },
            
            -- Resources that trigger research visibility
            resourceTypeIndexes = {
                resource.types.branch.index,
                resource.types.log.index,
            },
            
            -- Only visible after campfireCooking SKILL is learned
            researchRequiredForVisibilityDiscoverySkillTypeIndexes = {
                skill.types.campfireCooking.index,
            },
            
            -- Fast research
            initialResearchSpeedLearnMultiplier = 2.0,
        }

        -- Register the charcoalMaking research
        local charcoalMakingResearchIndex = research_:addResearch("charcoalMaking", charcoalMakingResearchConfig)
        if charcoalMakingResearchIndex then
            research_:updateDerivedInfo(research_.types.charcoalMaking)
            mj:log("Iron Age: charcoalMaking research registered with index:", charcoalMakingResearchIndex)
        else
            mj:warn("Iron Age: Failed to register charcoalMaking research")
        end
        ]]
    end
end

return mod
