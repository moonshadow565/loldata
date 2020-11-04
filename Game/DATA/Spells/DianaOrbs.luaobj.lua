NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Diana_W_LunarShower.dds"
BuffName = "DianaOrbs"
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ahri_foxfire_obd-sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dianashield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diana_w_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "dianaorbs"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "dianaorbsmissile"
    }
  }
}
