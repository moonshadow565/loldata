BuffTextureName = "Yeti_Shatter.dds"
BuffName = "AbsoluteZeroSlow"
AutoBuffActivateEffect = "GLOBAL_FREEZE.TROY"
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MovementSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MovementSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
