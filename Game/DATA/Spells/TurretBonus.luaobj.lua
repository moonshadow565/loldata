BuffTextureName = "1020_Glowing_Orb.dds"
BuffName = "Magical Sight"
OnBuffDeactivateBuildingBlocks = {}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      Delta = 6
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      Delta = 1.5
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      Delta = 1.5
    }
  }
}
