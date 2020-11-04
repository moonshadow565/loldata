BuffTextureName = "PlantKing_AnimateEntangler.dds"
BuffName = "Wrath of the Ancients"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicReduction,
      TargetVar = "Owner",
      Delta = -15
    }
  }
}
