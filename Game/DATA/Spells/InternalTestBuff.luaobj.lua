BuffTextureName = "GSB_invulnerability.dds"
BuffName = "InternalTestBuff"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "riftwalkcof"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "rewindcof"}
  }
}
