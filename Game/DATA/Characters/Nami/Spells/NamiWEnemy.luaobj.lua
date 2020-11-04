NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Fiddlesticks_DarkWind.dds"
BuffName = "Silence"
SpellDamageRatio = 1
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "SurprisePartyFiddlesticks"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "namiwmissileally"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "namiw"}
  }
}
