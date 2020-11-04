NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "Evelynn_ShadowWalkGray.dds"
BuffName = "ShadowWalkRevealedDebuff"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "evelyn_invis_exit_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shadowwalkrestealthfadeout"
    }
  }
}
