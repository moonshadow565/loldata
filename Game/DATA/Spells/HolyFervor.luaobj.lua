BuffTextureName = "Judicator_DivineBlessing.dds"
BuffName = "HolyFervor"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "MaxHealth",
      OwnerVar = "Owner",
      Function = GetMaxHealth
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxHealth",
      Src1Value = 0,
      Src2Value = 60,
      DestVar = "APAmount",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APAmount",
      Delta = 0
    }
  }
}
