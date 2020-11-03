NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sona_HymnofValorGold.dds"
SpellToggleSlot = 4
PersistsThroughDeath = true
SpellFXOverrideSkins = {"GuqinSona"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonahymnofvalor"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonahymnofvalorcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonahymnofvaloraura"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  }
}
