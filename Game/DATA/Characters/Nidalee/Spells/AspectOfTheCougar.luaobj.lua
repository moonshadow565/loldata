NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Nidalee_AspectOfTheCougar.dds"
BuffName = "AspectOfTheCougar"
SpellToggleSlot = 4
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "nidalee_cougar"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_transform.troy"
    }
  }
}
