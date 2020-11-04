NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "DarkChampion_Bloodlust.dds"
BuffName = "Bloodlust"
SpellToggleSlot = 1
AutoCooldownByLevel = {
  30,
  26,
  22,
  18,
  14
}
SpellFXOverrideSkins = {
  "TryndamereDemonsword"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tryndamere_heal.troy"
    }
  }
}
