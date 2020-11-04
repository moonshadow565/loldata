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
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghostself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianareturn"
    }
  }
}
