BuffTextureName = "Malphite_GraniteShield.dds"
BuffName = "MalphiteShield"
AutoBuffActivateEffect4 = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxHP",
      OwnerVar = "Target",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxHP",
      Src1Value = 0,
      Src2Value = 0.1,
      DestVar = "ShieldHP",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ShieldHP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ShieldHealth",
      MathOp = MO_ROUND
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ShieldHealth",
      Index = 1
    }
  }
}
