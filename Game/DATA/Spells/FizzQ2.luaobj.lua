NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonbloodsplattertarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzunlockanimation"
    }
  }
}
