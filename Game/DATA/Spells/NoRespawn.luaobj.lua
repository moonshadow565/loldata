NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffName = "NoRespawn"
PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentRespawnTimeMod,
      TargetVar = "Owner",
      Delta = -3000
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBAlert,
    Params = {
      ToAlert = "Should not be here"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentRespawnTimeMod,
      TargetVar = "Owner",
      Delta = -3000
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentRespawnTimeMod,
      TargetVar = "Owner",
      DestVar = "var"
    }
  },
  {
    Function = BBAlert,
    Params = {ToAlert = "YO!", SrcVar = "var"}
  }
}
