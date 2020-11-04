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
      Name = "Nami_Base_W_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "namiw"}
  }
}
