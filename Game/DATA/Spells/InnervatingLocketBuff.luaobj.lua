BuffTextureName = "3032_Innervating_Locket.dds"
BuffName = "Innervating Locket"
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 25,
          HealerVar = "Attacker"
        }
      },
      {
        Function = BBIncMana,
        Params = {TargetVar = "Owner", Delta = 10}
      }
    }
  }
}
