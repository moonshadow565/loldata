BuffTextureName = "Cryophoenix_Rebirth.dds"
BuffName = "RebirthReady"
PersistsThroughDeath = true
NonDispellable = true
OnPreDamagePriority = 8
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "rebirth"}
  }
}
