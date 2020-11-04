NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "AlZahar_SummonVoidling.dds"
BuffName = "AlZaharVoidling"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "voidlingflash.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharvoidlingphase2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alzaharvoidlingphase3"
    }
  }
}
