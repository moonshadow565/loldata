OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      Delta = 150
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      Delta = 150
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PersonalTurretAssistBonus",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1200,
      Flags = "AffectFriends AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "IndividualTurretAssistBonus",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Internal,
          MaxStack = 6,
          NumberStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetAreaRandom,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1000,
      Flags = "AffectEnemies AffectMinions AffectBarrackOnly ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "TurretBackdoorBonus",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 8,
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
      Name = "personalturretassistbonus"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "individualturretassistbonus"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretbackdoorbonus"
    }
  }
}
