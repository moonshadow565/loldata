BuffTextureName = "Lich_Defied.dds"
BuffName = "Death Defied Buff"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordekeiser_cotg_skin.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "defile"}
  }
}
