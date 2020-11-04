NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Sion_SpiritRage.dds"
BuffName = "Enrage"
PersistsThroughDeath = true
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "aatroxw2"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwpower"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "aatroxw"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwlife"
    }
  }
}
