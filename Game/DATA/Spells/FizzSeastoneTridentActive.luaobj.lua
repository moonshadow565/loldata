BuffTextureName = "Irelia_EquilibriumStrike.dds"
BuffName = "FizzMalison"
SpellToggleSlot = 2
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncAcquisitionRangeMod,
      TargetVar = "Owner",
      Delta = 100
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack1",
      OverrideAnim = "Crit",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack2",
      OverrideAnim = "Crit",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = true}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncAcquisitionRangeMod,
      TargetVar = "Owner",
      Delta = 0
    }
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack1", OwnerVar = "Owner"}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncAcquisitionRangeMod,
      TargetVar = "Owner",
      Delta = 100
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Target",
      BuffName = "Internal_50MS",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "GrievousWound",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSay,
    Params = {OwnerVar = "Owner", ToSay = "YO!"}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_50ms"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "grievouswound"
    }
  }
}
