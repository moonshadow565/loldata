DoesntBreakShields = true
DoesntTriggerSpellCasts = true
BuffTextureName = "GreenTerror_ChitinousExoplates.dds"
BuffName = "KhazixWMissile"
SpellFXOverrideSkins = {
  "KhazixDroid"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "khazixw"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_w_detonate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "khazix_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixwslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixwexplosioncheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "khazixwselfhealing"
    }
  }
}
