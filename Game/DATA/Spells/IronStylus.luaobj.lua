DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
AutoBuffActivateEffect = "RallyingBanner_itm.troy"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ironstylus_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ironstylusbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ironstyluscheck"
    }
  }
}
