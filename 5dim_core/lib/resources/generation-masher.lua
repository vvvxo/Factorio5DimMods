function genMasher(inputs)
    -- Copy electric furnace
    local itemMasher = table.deepcopy(data.raw.item["electric-furnace"])
    local recipeMasher = table.deepcopy(data.raw.recipe["electric-furnace"])
    local entityMasher = table.deepcopy(data.raw["furnace"]["electric-furnace"])
    local technologyMasher = table.deepcopy(data.raw.technology["advanced-material-processing"])

    --Item
    itemMasher.name = "5d-masher-" .. inputs.number
    itemMasher.icon = "__5dim_resources__/graphics/icon/masher/masher-icon-" .. inputs.number .. ".png"
    itemMasher.subgroup = inputs.subgroup
    itemMasher.order = inputs.order
    itemMasher.place_result = itemMasher.name

    --Recipe
    recipeMasher.name = itemMasher.name
    recipeMasher.result = itemMasher.name
    recipeMasher.icon = itemMasher.icon
    recipeMasher.icon_size = 64
    recipeMasher.enabled = false
    recipeMasher.ingredients = inputs.ingredients

    --Entity
    entityMasher.name = itemMasher.name
    entityMasher.icon = itemMasher.icon
    entityMasher.minable.result = itemMasher.name
    entityMasher.crafting_speed = inputs.craftingSpeed
    entityMasher.module_specification.module_slots = inputs.moduleSlots
    entityMasher.energy_usage = inputs.energyUsage .. "kW"
    entityMasher.animation.layers[1].hr_version.filename =
        "__5dim_resources__/graphics/entities/masher/masher-" .. inputs.number .. ".png"
    entityMasher.animation.layers[1].hr_version.width = 160
    entityMasher.animation.layers[1].hr_version.height = 160
    entityMasher.animation.layers[1].hr_version.shift = {0, -0.421875}
    entityMasher.animation.layers[1].hr_version.scale = 1
    entityMasher.crafting_categories = {"mashering"}
    entityMasher.energy_source.emissions_per_minute = inputs.pollution
    entityMasher.fast_replaceable_group = "5d-masher"

    data:extend({entityMasher, recipeMasher, itemMasher})

    if inputs.tech then
        -- Technology
        technologyMasher.name = "5d-masher-" .. inputs.tech.number
        technologyMasher.icon = itemMasher.icon
        technologyMasher.icon_size = 64
        technologyMasher.unit.count = inputs.tech.count
        technologyMasher.unit.ingredients = inputs.tech.packs
        technologyMasher.prerequisites = inputs.tech.prerequisites
        technologyMasher.effects = {
            {
                type = "unlock-recipe",
                recipe = itemMasher.name
            }
        }
        data:extend({technologyMasher})
    end
end
