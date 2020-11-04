DoesntBreakShields = false
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
