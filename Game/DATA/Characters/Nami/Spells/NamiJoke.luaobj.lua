NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Minotaur_Headbutt.dds"
BuffName = "Charging"
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "fizzshark"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "fizzshark"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_sharksplash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "fizz_sharksplash_ground.troy "
    }
  }
}
