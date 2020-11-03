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
      Name = "evelynn_redeye.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shadowwalkrevealedwarning"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "evelynn_yelloweye.troy"
    }
  }
}
