BuffTextureName = "VolibearPassive.dds "
BuffName = "VolibearPassiveBuff"
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "RegenTooltip",
      ValueVarTable = "CharVars",
      Index = 1
    }
  }
}
