BuffTextureName = "Janna_Tailwind.dds"
BuffName = "TailwindSelf"
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0.03
    }
  }
}
