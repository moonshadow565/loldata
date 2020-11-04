NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Braum_ThatsMyCarry.dds"
BuffName = "BraumPowerOfTwoPassiveStats"
PersistsThroughDeath = true
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "braum_w_shield_passive_enemy_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "braum_w_shield_passive_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "braumpoweroftwopassivestats"
    }
  }
}
