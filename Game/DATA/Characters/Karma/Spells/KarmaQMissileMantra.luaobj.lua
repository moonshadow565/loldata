NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Karma_Q2.dds"
BuffName = "KarmaQMissileMantra"
SpellDamageRatio = 0.5
PersistsThroughDeath = true
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaqmissilemantraslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tormentedsoil_green_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tormentedsoil_red_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tempkarma_qdoteffect_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_q_impact_r_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_q_impact_red_r_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_q_impact_r_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_p_refresh.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "karma_base_q_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "karmaqmissilemantra"
    }
  }
}
