NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Yasuo_E.dds"
BuffName = "YasuoDashWrapper"
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "YasuoSkin02"
}
SpellVOOverrideSkins = {
  "YasuoSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuodummyspell"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuoeqcomboselfmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "yasuodash"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yasuodashcantcastsound"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_e_timer1.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_base_e_timer1.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_e_timer2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_base_e_timer2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_e_timer3.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_base_e_timer3.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_e_timer4.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_base_e_timer4.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_skin01_e_timer5.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "yasuo_base_e_timer5.troy"
    }
  }
}
