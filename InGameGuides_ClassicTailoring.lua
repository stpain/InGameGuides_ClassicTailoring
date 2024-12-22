

local addonName, addon = ...;

local locales = {
    enUS = {
        BELT_OR_BAG_NOTE = "If there is a demand for runecloth bags it might worth startign to craft them now, otherwise just choose the belt option.",
        QIA_RECIPE_NOTE = "Pattern sold by Qia in Everloook (Winterspring), limited supply.",
    }
}


local locale = GetLocale()

local guide = {

    --this acts as the guide ID (as its a tradeskill use that ID)
    skillLineID = 197,

    --expansion info (doesn't effect non retail clients)
    expansionSkillLineID = 2540,

    --guide name
    name = "Tailoring",

    --guide type
    type = "tradeskill",

    --target expansion
    expansion = "classic",

    --guide template to use for the steps (the frames used in the IGG listview)
    stepTemplate = "IGGStepTemplate",

    --this can be a fixed height or function returning a height
    --using a function will allow you to control if the step listview element is bigger to show space for the notes
    --the function will be passed the step table
    stepTemplateHeight = function(step)
        if type(step.craft.itemID) == "table" then
            return (67 + (#step.craft.itemID * 12))
        elseif step.craft.notes and step.craft.notes == "" then
            return 67;
        elseif step.craft.notes and #step.craft.notes > 0 then
            return 80;
        else
            return 67;
        end
    end,


    --{ itemID, amount, }
    materials = {
        { 2589, 204, },
        { 2592, 135, },
        { 4306, 804, },
        { 4338, 470, },
        { 14047, 1195, },
        { 8170, 110, }
    },

    author = "",

    --guide steps, this table will be what is used to populate the IGG listview
    --each entry is a 'step' in the guide and has its own listview entry
    steps = {
        {
            --title (tradeskill guides use a template that formats this into a title string)
            skillLevel = { 1, 45, },

            --action (tradeskill guide template uses this data to display the amount/item to craft)
            craft = {
                amount = 102,
                itemID = 2996,
                notes = "",
            },
        },
        {
            skillLevel = { 40, 70, },
            craft = {
                amount = 40,
                itemID = 7026,
                notes = "",
            },
        },
        {
            skillLevel = { 70, 75, },
            craft = {
                amount = 5,
                itemID = 2580,
                notes = "",
            }
        },
        {
            skillLevel = { 75, 100, },
            craft = {
                amount = 45,
                itemID = 2997,
                notes = "",
            }
        },
        {
            skillLevel = { 100, 110, },
            craft = {
                amount = 13,
                itemID = 10047,
                notes = "",
            }
        },
        {
            skillLevel = { 110, 125, },
            craft = {
                amount = 15,
                itemID = 4314,
                notes = "",
            }
        },
        {
            skillLevel = { 125, 145, },
            craft = {
                amount = 201,
                itemID = 4305,
                notes = "",
            }
        },
        {
            skillLevel = { 145, 160, },
            craft = {
                amount = 18,
                itemID = 7048,
                notes = "",
            }
        },
        {
            skillLevel = { 160, 170, },
            craft = {
                amount = 10,
                itemID = 7050,
                notes = "",
            }
        },
        {
            skillLevel = { 170, 175, },
            craft = {
                amount = 5,
                itemID = 4334,
                notes = "",
            }
        },
        {
            skillLevel = { 175, 185, },
            craft = {
                amount = 94,
                itemID = 4339,
                notes = "",
            }
        },
        {
            skillLevel = { 185, 205, },
            craft = {
                amount = 20,
                itemID = 7058,
                notes = "",
            }
        },
        {
            skillLevel = { 205, 215, },
            craft = {
                amount = 10,
                itemID = 7062,
                notes = "",
            }
        },
        {
            skillLevel = { 215, 220, },
            craft = {
                amount = 5,
                itemID = 10056,
                notes = "",
            }
        },
        {
            skillLevel = { 220, 230, },
            craft = {
                amount = 10,
                itemID = 10003,
                notes = "",
            }
        },
        {
            skillLevel = { 230, 250, },
            craft = {
                amount = 23,
                itemID = 10024,
                notes = "",
            }
        },
        {
            skillLevel = { 250, 260, },
            craft = {
                amount = 239,
                itemID = 14048,
                notes = "",
            }
        },
        {
            skillLevel = { 260, 280, },
            craft = {
                amount = 25,
                itemID = {13856, 14046, },
                notes = locales[locale].BELT_OR_BAG_NOTE,
            }
        },
        -- {
        --     skillLevel = { 260, 280, },
        --     craft = {
        --         amount = 25,
        --         itemID = 14046,
        --         notes = "",
        --     }
        -- },
        {
            skillLevel = { 280, 290, },
            craft = {
                amount = 18,
                itemID = 14046,
                notes = locales[locale].QIA_RECIPE_NOTE,
            }
        },
        {
            skillLevel = { 290, 300, },
            craft = {
                amount = 18,
                itemID = 13863,
                notes = locales[locale].QIA_RECIPE_NOTE, --14481 pattern
            }
        },
    }
}

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and (...) == addonName then
        if IGG and IGG.CallbackRegistry then
            IGG.CallbackRegistry:TriggerEvent("Guide_OnGuideLoaded", addonName, guide)
        end
    end
end)