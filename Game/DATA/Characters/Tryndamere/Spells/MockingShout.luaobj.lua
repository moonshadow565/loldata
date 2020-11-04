NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Tryndamere_W.dds"
BuffName = "Mocking Shout"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mockingshoutslow"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  }
}
