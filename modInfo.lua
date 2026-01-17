local modInfo = {
    name = "Iron Ages",
    description = "Transform your civilization with iron and charcoal! All greenstone rocks now contain iron ore. Smelt 2 iron ore + 1 charcoal into 3 iron ingots, then forge a complete set of iron tools. Iron tools are superior to bronze: 1.8x speed/damage and 6.0x durability. Includes charcoal production (5x fuel efficiency) and standalone tools (axehead, knife, chisel) and assembled tools (axe, spear, pickaxe, hammer). Discover iron smelting by mining greenstone, then unlock tool assembly research. Pure Lua implementation with full research and crafting integration.",
    type = "world",
    developer = "Yaz",
    version = "1.0.0",
    loadOrder = 0,  -- Load BEFORE Arsenic Bronze (which has loadOrder = 1)
    preview = "ironAge.jpg",
}

return modInfo
