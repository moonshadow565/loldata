BuffTextureName = "122_Frozen_Heart.dds"
BuffName = "FrozenHeartAura"
AutoBuffActivateEffect = ""
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = -0.25
    }
  }
}
