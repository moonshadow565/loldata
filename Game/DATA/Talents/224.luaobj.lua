UpdateSelfBuffActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 3,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
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
          DestVar = "MasteryDemolitionist",
          DestVarTable = "AvatarVars",
          SrcValue = true
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MasteryDemolitionistAmt",
          DestVarTable = "AvatarVars",
          SrcValueByLevel = {10}
        }
      }
    }
  }
}
