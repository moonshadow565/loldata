OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      Delta = -175
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      Delta = -175
    }
  },
  {
    Function = BBDebugSay,
    Params = {
      OwnerVar = "Owner",
      ToSay = "Backdoor Bonus Activated"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      Delta = 175
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      Delta = 175
    }
  }
}
