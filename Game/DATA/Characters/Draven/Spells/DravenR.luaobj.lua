NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "Draven_Gladiator"
}
SpellVOOverrideSkins = {
  "CyberEzreal"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "dravenr"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_r_tar_shadow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_gladiator_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_gladiator_r_missile_recall_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_r_missile_recall_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_gladiator_r_missile_end_sound.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "draven_r_missile_end_sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dravenrcast"
    }
  }
}
