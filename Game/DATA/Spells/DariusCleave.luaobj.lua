NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darius_q_aoe_cast.troy"
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
