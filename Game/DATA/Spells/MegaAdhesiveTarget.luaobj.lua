BuffTextureName = "ChemicalMan_LaunchGoo.dds"
BuffName = "Mega Adhesive"
AutoBuffActivateEffect = "global_slow.troy"
AutoBuffActivateAttachBoneName = ""
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SlowPercent",
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
      DeltaVar = "SlowPercent",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
