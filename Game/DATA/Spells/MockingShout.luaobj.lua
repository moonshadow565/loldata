NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "48thSlave_Pacify.dds"
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
