BuffTextureName = "2008_Tome_of_Combat_Mastery.dds"
BuffName = "WillOfTheAncientsFriendly"
AutoBuffActivateEffect = ""
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatGoldPer10Mod,
      TargetVar = "Owner",
      Delta = 5
    }
  }
}
