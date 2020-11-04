NotSingleTargetSpell = false
DoesntBreakShields = true
CastingBreaksStealth = false
BuffTextureName = "Evelynn_ReadyToBetray.dds"
BuffName = "ShadowMark"
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aniviarwarning.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
