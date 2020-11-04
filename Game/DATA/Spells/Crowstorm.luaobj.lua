NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
ChannelDuration = 1.5
BuffTextureName = "Fiddlesticks_Crowstorm.dds"
BuffName = "Crowstorm"
AutoCooldownByLevel = {
  150,
  120,
  100
}
SpellFXOverrideSkins = {
  "SurprisePartyFiddlesticks",
  "CandyCaneFiddlesticks"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "crowstorm_green_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "crowstorm_red_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_hornconfetti.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "paranoiamisschance"
    }
  }
}
