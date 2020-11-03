NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
BuffName = "BlindMonkSafeguard"
AutoBuffActivateEffect = "enrage_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "enrage_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
AutoCooldownByLevel = {
  22,
  18,
  14,
  10,
  6
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpeedBoost",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "SpeedBoost",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "SpeedBoost",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
