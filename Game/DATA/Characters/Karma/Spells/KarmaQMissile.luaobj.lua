NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
SpellDamageRatio = 0.5
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaqmissile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_qhiteffect_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_q_explosion.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaqmissileslow"
    }
  }
}
