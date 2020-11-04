NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sona_W_Gold.dds"
BuffName = "SonaWShield"
SpellFXOverrideSkins = {"GuqinSona", "PaxSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_w_shield.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sona_base_w_shield_sfx.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
