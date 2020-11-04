NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 5
BuffTextureName = "Fiddlesticks_ConjureScarecrow.dds"
BuffName = "Drain"
AutoBuffActivateEffect = ""
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "SurprisePartyFiddlesticks"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldrain"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_drainglow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_hornconfetti.troy"
    }
  }
}
