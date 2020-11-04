NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3057_Sheen.dds"
BuffName = "Sheen"
SpellVOOverrideSkins = {"BroOlaf"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "yomuizuna"}
  },
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
    Function = BBPreloadSpell,
    Params = {
      Name = "yomuizunadamage"
    }
  }
}
