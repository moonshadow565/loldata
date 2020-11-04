NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "UrgotPositionReverser.dds"
BuffName = "UrgotSwapDef"
AutoCooldownByLevel = {
  22,
  20,
  18,
  16,
  14
}
SpellFXOverrideSkins = {
  "BattlecastUrgot"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotswapdef_battlecast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgot_battlecast_swap_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotswapdef.troy"
    }
  }
}
