OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      Delta = 20
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "CurHealth",
      OwnerVar = "Owner",
      Function = GetHealth
    }
  },
  {
    Function = BBGetManaOrHealth,
    Params = {
      DestVar = "CurHealthPercent",
      OwnerVar = "Owner",
      Function = GetHealthPercent
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurHealthPercent",
      Src2Var = ".1",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageMod",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "DamageMod",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "CurHealth",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "CurHealth",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      }
    }
  }
}
