BuffTextureName = "122_Frozen_Heart.dds"
BuffName = "FrozenHeartAura"
AutoBuffActivateEffect = ""
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeAttackSpeedMod,
      TargetVar = "Owner",
      Delta = -0.2
    }
  }
}
