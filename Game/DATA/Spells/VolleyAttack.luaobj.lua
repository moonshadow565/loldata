NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
SpellDamageRatio = 0.5
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volleyattack"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "bowmaster_basicattack_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "frostarrow"}
  }
}
