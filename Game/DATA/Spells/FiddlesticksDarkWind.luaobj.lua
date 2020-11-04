NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Fiddlesticks_DarkWind.dds"
BuffName = "Silence"
AutoBuffActivateEffect = "LOC_Silence.troy"
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "SurprisePartyFiddlesticks",
  "CandyCaneFiddlesticks"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fiddlesticksdarkwindmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "darkwind"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_darkwind_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darkwind_tar.troy"
    }
  }
}
