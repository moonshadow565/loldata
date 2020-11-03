BuffTextureName = "VolibearPassiveGray.dds"
BuffName = "VolibearPassiveCD"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearpassivehealcheck"
    }
  }
}
