BuffTextureName = "3064_Spike_the_Ripper.dds"
BuffName = "GuinsoosRageblade"
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
      Delta = 6
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
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
      Delta = -6
    }
  }
}
