NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Summoner_boost.dds"
BuffName = "Spell Shield"
AutoBuffActivateEffect = "SpellBlock_eff.troy"
AutoCooldownByLevel = {
  44,
  38,
  30,
  22,
  14
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "spelleffect_proc.troy"
    }
  }
}
