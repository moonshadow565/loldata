BuffTextureName = "3034_Kenyus_Kukri.dds"
BuffName = "MuramasaCap"
PersistsThroughDeath = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      Delta = 2
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatCritDamageMod,
      TargetVar = "Owner",
      Delta = 0.02
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "MuramasaCheck"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "MuramasaStats"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Count",
      Src1Value = 2,
      Src2Value = 0,
      DestVar = "ValueDisplay",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ValueDisplay",
      Index = 1
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "ValueDisplay",
      Index = 2
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "muramasacheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "muramasastats"
    }
  }
}
