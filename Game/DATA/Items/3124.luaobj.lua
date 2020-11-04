BuffTextureName = "139_Strygwyrs_Reaver.dds"
BuffName = "Rageblade"
OnDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = -0.04
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      Delta = -7
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0.04
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      Delta = 7
    }
  }
}
ItemOnLaunchAttackBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Rageblade",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 8,
      NumberStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "rageblade"}
  }
}
