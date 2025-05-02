--data.lua

local longer_fire = table.deepcopy(data.raw["fire"]["fire-flame"])
longer_fire.name = "fire-starter-pack-fire"
longer_fire.initial_lifetime = 900
longer_fire.lifetime_increase_by = 600

-- local fire_starter_sound = {
--     category = "weapon",
--     priority = 64,
--     variations = {filename = "__fire-starter__/sound/flind-and-steel-click.ogg"}
-- }

local fire_starter_recipe = {
    type = "recipe",
    name = "fire-starter-pack",
    enabled = false,
    ingredients ={
        {"stone", 2},
        {"iron-plate", 2}
    },
    result = "fire-starter-pack"
}

local fire_starter_tech = {
    type = "technology",
    name = "fire-starter-pack",
    icon_size = 64,
    icon = "__fire-starter__/graphics/icons/flint-and-steel.png",  -- TODO: better sprite
    effects = {{type="unlock-recipe", recipe="fire-starter-pack"}},
    unit = {ingredients={{"automation-science-pack", 1}}, count=10, time=10},
    order = "c-c"
}

local fire_starter_capsule = {
    type = "capsule",
    name = "fire-starter-pack",
    icon = "__fire-starter__/graphics/icons/flint-and-steel.png",
    icon_size = 64,
    subgroup = "capsule",
    order = "a[fire]-a[normal]",
    stack_size = 50,
    capsule_action = 
    {
        type = "throw",
        attack_parameters = 
        {
            type = "beam",
            range = 15,
            cooldown = 20,
            activation_type = "activate",
            ammo_category = "capsule",
            -- TODO: add Minecraft flint and steel sound
            ammo_type = 
            {
                target_type = "position",
                action = 
                {
                    {
                        type = "direct",
                        action_delivery =
                        {
                            type = "instant",
                            source_effects = 
                            {
                                {
                                    type = "play-sound",
                                    sound = {"__fire-starter__/sound/flind-and-steel-click.ogg"}
                                }
                            },
                            target_effects = 
                            {
                                {
                                    type = "create-fire",
                                    entity_name = "fire-starter-pack-fire",
                                },
                            }
                        }
                    },
                }
            }
        }
    }
}

data:extend(
{
    longer_fire,
    fire_starter_recipe,
    fire_starter_tech,
    fire_starter_capsule,
})
