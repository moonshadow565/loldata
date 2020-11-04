NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
SpellVOOverrideSkins = {"BroOlaf"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "olafaxe"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafaxeexpirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "olafslow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafaxethrowdamage"
    }
  }
}
