NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "RengarQ.dds"
BuffName = "RengarQBuff"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqbasebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "rengarqemp"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "rengarq"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqbuffbonusinternal"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarqbase"
    }
  }
}
