NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncAcquisitionRangeMod,
      TargetVar = "Owner",
      Delta = -600
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncAcquisitionRangeMod,
      TargetVar = "Owner",
      Delta = -600
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetGhosted
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncAcquisitionRangeMod,
      TargetVar = "Owner",
      Delta = 0
    }
  }
}
