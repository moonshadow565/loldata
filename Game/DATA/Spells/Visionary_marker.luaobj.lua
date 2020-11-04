BuffTextureName = "Yeti_FrostNova.dds"
BuffName = "Visionary"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HitCount",
      DestVarTable = "CharVars",
      SrcValue = 0
    }
  }
}
