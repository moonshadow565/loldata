NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = "BlindMonk_FistsOfFury.dds"
BuffName = "UdyrPassiveBuff"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "udyr_spiritguard_audio_max.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrmonkeyagilitybuff"
    }
  }
}
