TargetExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Owner",
      BuffName = "BlackShield"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "BlackShield"
        }
      },
      {
        Function = BBDebugSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "DISPELL BlackShield"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ShieldHealth",
          DestVarTable = "NextBuffVars",
          SrcValue = 1000
        }
      },
      {
        Function = BBDebugSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "ADD BlackShield 1000 Health"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "BlackShield",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_SpellImmunity,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blackshield"
    }
  }
}
