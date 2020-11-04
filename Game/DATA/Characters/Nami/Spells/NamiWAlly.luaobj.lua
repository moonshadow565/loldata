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
    Function = BBPreloadSpell,
    Params = {
      Name = "namipassivedebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_w_heal.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_w_tar_ally.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "namiw"}
  }
}
