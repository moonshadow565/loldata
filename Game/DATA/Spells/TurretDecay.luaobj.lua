BuffTextureName = "1020_Glowing_Orb.dds"
BuffName = "Turret Decay"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 60,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatArmorMod,
          TargetVar = "Owner",
          Delta = -3
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatSpellBlockMod,
          TargetVar = "Owner",
          Delta = -3
        }
      }
    }
  }
}
