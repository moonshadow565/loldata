CharOnActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetImmovable
    }
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = true}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinGuardianBuff",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinGuardianUI",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TurretDamageManager",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 1,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectEnemies AffectFriends AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = false
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Unit",
          BuffName = "OdinPlayerBuff",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HPPerLevel",
      DestVarTable = "NextBuffVars",
      SrcValue = 75
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DmgPerLevel",
      DestVarTable = "NextBuffVars",
      SrcValue = 15
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorPerLevel",
      DestVarTable = "NextBuffVars",
      SrcValue = 4
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MR_per_level",
      DestVarTable = "NextBuffVars",
      SrcValue = 2
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OdinGuardianStatsByLevel",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardianbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardianui"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretdamagemanager"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinplayerbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardianstatsbylevel"
    }
  }
}
