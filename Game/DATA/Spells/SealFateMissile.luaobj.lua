NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "UnderworldTwistedFate"
}
TriggersSpellCasts = false
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sealfatemissile"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "roulette_hit.troy"
    }
  }
}
