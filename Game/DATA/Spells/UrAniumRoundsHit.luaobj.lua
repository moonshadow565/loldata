BuffTextureName = "Bowmaster_IceArrow.dds"
BuffName = "UrAniumRoundsHit"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      Delta = -2
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      Delta = -2
    }
  }
}
