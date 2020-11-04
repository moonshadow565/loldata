BuffTextureName = "Sona_SongofDiscord.dds"
BuffName = "SonaSongofDiscordAuraB"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MSBoost",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MSBoost",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
