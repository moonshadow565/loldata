BuffTextureName = "Twitch_DeadlyVenom_temp.dds"
BuffName = "TrundleDiseaseOpponent"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DebuffAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DebuffAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DebuffAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
