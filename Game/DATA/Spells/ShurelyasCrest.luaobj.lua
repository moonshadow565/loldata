DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "3065_Spirit_Visage.dds"
BuffName = "Spirit Visage"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shurelyasspell"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shurelyascrest_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "haste"}
  }
}
