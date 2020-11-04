NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Cassiopeia_DeadlyCadence4.dds"
BuffName = "CassiopeiaPoisonTicker4"
SpellDamageRatio = 1
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cassiopeia_base_p_deadlycadence_buff.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
