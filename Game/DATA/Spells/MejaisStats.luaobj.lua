BuffTextureName = "3041_Mejais_Soulstealer.dds"
BuffName = "MejaisCap"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      Delta = 8
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "MejaisCheck"
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
      BuffName = "MejaisStats"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "Count",
      Src1Value = 8,
      Src2Value = 0,
      DestVar = "APDisplay",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "APDisplay",
      Index = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mejaischeck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mejaisstats"
    }
  }
}
