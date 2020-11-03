NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffName = "TalonRakeMissileOne"
SpellDamageRatio = 0.5
IsDeathRecapSource = true
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonrakemarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "talon_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "talonrakemissileonemarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "talonslow"}
  }
}
