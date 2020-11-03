UpdateSelfBuffStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "TalentLevel"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Vamp",
      SrcValueByLevel = {
        0.01,
        0.02,
        0.03,
        0.04
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentSpellVampMod,
      TargetVar = "Owner",
      DeltaVar = "Vamp",
      Delta = 0
    }
  }
}
UpdateSelfBuffActionsBuildingBlocks = {}
