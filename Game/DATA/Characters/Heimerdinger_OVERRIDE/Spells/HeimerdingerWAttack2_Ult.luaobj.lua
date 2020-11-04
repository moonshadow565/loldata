NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
SpellDamageRatio = 0.5
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "chilled"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingerwattack2"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_hextech_missile_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_hextech_missile_tar_ult.troy"
    }
  }
}
