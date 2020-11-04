NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Irelia_HitenStyleReady.dds"
BuffName = "IreliaHitenStyle"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_hitenstyle_passive.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_hitenstlye_passive_glow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "irelia_hitenstlye_passive_glow_end.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ireliahitenstylecharged"
    }
  }
}
