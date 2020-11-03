NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "AkaliCrescentSlash.dds"
BuffName = "RenekthonCleaveReady"
SpellToggleSlot = 1
SpellDamageRatio = 0.5
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzjumpbuffer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fizzjumpbuffered"
    }
  }
}
