BuffTextureName = "3138_Leviathan.dds"
BuffName = "LeviathanCap"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPPoolMod,
      TargetVar = "Owner",
      Delta = 37.5
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "LeviathanCheck"
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
      BuffName = "LeviathanStats"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Count",
      Src1Value = 37.5,
      Src2Value = 0,
      DestVar = "HealthDisplay",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "HealthDisplay",
      Index = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leviathancheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leviathanstats"
    }
  }
}
