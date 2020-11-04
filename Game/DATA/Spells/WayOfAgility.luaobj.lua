NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "WayOfAgilityCritical"
    },
    SubBlocks = {
      {
        Function = BBDebugSay,
        Params = {OwnerVar = "Target", ToSay = "Dodge Up!"}
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "WayOfAgilityCritical"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "WayOfAgilityDodge",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Haste,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 9999,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBDebugSay,
        Params = {
          OwnerVar = "Target",
          ToSay = "Critical Chance Up!"
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "WayOfAgilityDodge"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "WayOfAgilityCritical",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Haste,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 9999,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wayofagilitycritical"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wayofagilitydodge"
    }
  }
}
