NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "VarusW.dds"
BuffName = "VarusW"
SpellToggleSlot = 2
IsDeathRecapSource = true
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "VarusAscended"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuswdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "varuswparticle"
    }
  }
}
