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
      Name = "Khazix_Base_W_Tar.troy"
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
