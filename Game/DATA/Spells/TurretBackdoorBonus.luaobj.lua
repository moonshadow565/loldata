OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      Delta = -200
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      Delta = -200
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
      Delta = 200
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      Delta = 200
    }
  }
}
