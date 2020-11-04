NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
SpellToggleSlot = 1
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_base_q_ally.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_base_q_enemy.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_base_q_end.troy"
    }
  }
}
