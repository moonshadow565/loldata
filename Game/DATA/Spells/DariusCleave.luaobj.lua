NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "Darius_ZaunKnight",
  "Darius_NorseKing"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darius_q_aoe_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darius_q_aoe_cast_mist.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darius_atomic_mist_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darius_q_impact_spray.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonunlockanimationcleave"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "dariushemo"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dariuscleaveclosetarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dariushemointernal"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dariushemovisual"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darius_q_tar_inner.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darius_q_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dariuscleave"
    }
  }
}
