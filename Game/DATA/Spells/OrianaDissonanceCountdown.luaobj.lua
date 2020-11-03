NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3114_Malady.dds"
BuffName = "Malady"
SpellVOOverrideSkins = {"BroOlaf"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "yomughost"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yomughostminion"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotheatseekingindicator.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yomudissonance"
    }
  }
}
