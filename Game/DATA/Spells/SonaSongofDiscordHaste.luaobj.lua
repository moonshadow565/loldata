BuffTextureName = "Sona_SongofDiscord.dds"
BuffName = "SonaSongofDiscordHaste"
AutoBuffActivateEffect = "Global_Haste.troy"
AutoBuffActivateEffect2 = "SonaSongofDiscord_tarB.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
