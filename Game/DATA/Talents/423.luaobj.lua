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
      DestVar = "RegenMod",
      SrcValueByLevel = {
        0.2,
        0.4,
        0.6
      }
    }
  },
  {
    Function = BBIncFlatPARRegenMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      DeltaVar = "RegenMod",
      Delta = 0
    }
  }
}
