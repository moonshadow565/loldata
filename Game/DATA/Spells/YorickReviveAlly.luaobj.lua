BuffTextureName = "Mordekaiser_COTG.dds"
BuffName = "MordekaiserCOTGDot"
AutoBuffActivateEffect = "mordekeiser_cotg_tar.troy"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickreviveallyself"
    }
  }
}
