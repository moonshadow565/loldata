NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sivir_SpellBlock.dds"
BuffName = "Spell Shield"
AutoBuffActivateEffect = "SpellBlock_eff.troy"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "spelleffect_proc.troy"
    }
  }
}
