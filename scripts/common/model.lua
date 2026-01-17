local mod = {
    loadOrder = 1,
}

function mod:onload(model)
    
    mj:log("Iron Age: Model remaps starting")
    
    -- Override greenRock terrain models to use ironOre material
    model.remapModels.greenRock = model.remapModels.greenRock or {}
    model.remapModels.greenRock.greenRock = { ore = "ironOre" }  -- Terrain rocks
    model.remapModels.greenRock.ironOre = { ore = "ironOre" }    -- Dropped ore objects
    
    model.remapModels.greenRockSmall = model.remapModels.greenRockSmall or {}
    model.remapModels.greenRockSmall.greenRockSmall = { ore = "ironOre" }
    model.remapModels.greenRockSmall.ironOre = { ore = "ironOre" }
    
    model.remapModels.greenRockLarge = model.remapModels.greenRockLarge or {}
    model.remapModels.greenRockLarge.greenRockLarge = { ore = "ironOre" }
    model.remapModels.greenRockLarge.ironOre = { ore = "ironOre" }
    
    -- Also add ore model remap (needed for game object model lookup)
  --  model.remapModels.ore = model.remapModels.ore or {}
    model.remapModels.ore.ironOre = { ore = "ironOre" }
    
    mj:log("Iron Age: Model remaps registered (greenstone → iron ore)")
    
    -- Ingot (from generic ingot model)
    model.remapModels.ingot = model.remapModels.ingot or {}
    model.remapModels.ingot.ironIngot = { metal = "iron" }
    
    -- Tool heads (from metal tool head models)
    model.remapModels.metalAxeHead = model.remapModels.metalAxeHead or {}
    model.remapModels.metalAxeHead.ironAxeHead = { metal = "iron" }
    
    model.remapModels.metalSpearHead = model.remapModels.metalSpearHead or {}
    model.remapModels.metalSpearHead.ironSpearHead = { metal = "iron" }
    
    model.remapModels.metalPickaxeHead = model.remapModels.metalPickaxeHead or {}
    model.remapModels.metalPickaxeHead.ironPickaxeHead = { metal = "iron" }
    
    model.remapModels.metalHammerHead = model.remapModels.metalHammerHead or {}
    model.remapModels.metalHammerHead.ironHammerHead = { metal = "iron" }
    
    -- Small tools
    model.remapModels.metalKnife = model.remapModels.metalKnife or {}
    model.remapModels.metalKnife.ironKnife = { metal = "iron" }
    
    model.remapModels.metalChisel = model.remapModels.metalChisel or {}
    model.remapModels.metalChisel.ironChisel = { metal = "iron" }
    
    -- Assembled tool remaps (reuse vanilla models with component preservation)
    model.remapModels.flintHatchet = model.remapModels.flintHatchet or {}
    model.remapModels.flintHatchet.ironAxe = {}  -- Empty = reuse flintHatchet.glb model
    
    model.remapModels.flintHatchetBuild = model.remapModels.flintHatchetBuild or {}
    model.remapModels.flintHatchetBuild.ironAxeBuild = {}
    
    model.remapModels.flintSpear = model.remapModels.flintSpear or {}
    model.remapModels.flintSpear.ironSpear = {}
    
    model.remapModels.flintSpearBuild = model.remapModels.flintSpearBuild or {}
    model.remapModels.flintSpearBuild.ironSpearBuild = {}
    
    model.remapModels.flintPickaxe = model.remapModels.flintPickaxe or {}
    model.remapModels.flintPickaxe.ironPickaxe = {}
    
    model.remapModels.flintPickaxeBuild = model.remapModels.flintPickaxeBuild or {}
    model.remapModels.flintPickaxeBuild.ironPickaxeBuild = {}
    
    model.remapModels.stoneHammer = model.remapModels.stoneHammer or {}
    model.remapModels.stoneHammer.ironHammer = {}  -- Both mods use stoneHammer (it's the only vanilla hammer)
    
    model.remapModels.stoneHammerBuild = model.remapModels.stoneHammerBuild or {}
    model.remapModels.stoneHammerBuild.ironHammerBuild = {}

    -- Charcoal model remaps from merged Charcoal mod
    -- Try remapping charcoal model to use charcoal material
    -- The charcoal.glb model needs to have its material slot remapped
    
    -- Try coal remap (for coal-based models)
    model.remapModels.ore = model.remapModels.ore or {}
    model.remapModels.ore.charcoal = { ore = "charcoal" }
    
    -- Also try direct charcoal remap
    model.remapModels.charcoal = model.remapModels.charcoal or {}
    model.remapModels.charcoal.charcoal = { charcoal = "charcoal" }
    
    -- Try resource remap (like branch/log use)
    model.remapModels.resource = model.remapModels.resource or {}
    model.remapModels.resource.charcoal = { resource = "charcoal" }
    
    -- Try wood remap
    model.remapModels.wood = model.remapModels.wood or {}
    model.remapModels.wood.charcoal = { wood = "charcoal" }

    mj:log("Iron Age: All model remaps completed (ore, ingot, 6 tool heads, 2 small tools, 4 assembled tools + builds)")
end

return mod
