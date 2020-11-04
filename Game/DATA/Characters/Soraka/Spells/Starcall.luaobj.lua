NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Soraka_Q.dds"
BuffName = "Starcall"
SpellDamageRatio = 0.35
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_cleric_starcall_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "starcall_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "starcalldamage"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "soraka_q_reduction.troy"
    }
  }
}
