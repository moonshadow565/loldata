DoesntTriggerSpellCasts = true
BuffTextureName = "3180_OdynsVeil.dds"
BuffName = "OdynsVeil"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "odynsveil_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "odynsveil"}
  }
}
