NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 5
BuffTextureName = "Fiddlesticks_ConjureScarecrow.dds"
BuffName = "Drain"
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "SurprisePartyFiddlesticks",
  "CandyCaneFiddlesticks"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fearmonger_marker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {Name = "drain.troy"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_drainglow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldrain"
    }
  }
}
