BuffTextureName = "YorickUnholyCovenant.dds"
BuffName = "YorickUnholySymbiosis"
PersistsThroughDeath = true
NonDispellable = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 2,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "YorickAP"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "YorickAP",
          Src1Value = 0,
          Src2Value = 0.2,
          DestVar = "ADFromAP",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "YorickAP",
          Src1Value = 0,
          Src2Value = 0.5,
          DestVar = "HealthFromAP",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "ADFromAP",
          Index = 1
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "HealthFromAP",
          Index = 2
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PassiveMultiplier",
      SrcValue = 0.05
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Count", SrcValue = 0}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Nothing",
      BuffName = "YorickSummonSpectral"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Count",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Nothing",
      BuffName = "YorickSummonRavenous"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Count",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Nothing",
      BuffName = "YorickSummonDecayed"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Count",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Nothing",
      BuffName = "YorickRARemovePet"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Count",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Nothing",
      BuffName = "YorickUltPetActive"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Count",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Count",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src2Var = "PassiveMultiplier",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "PassiveMultiplier",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PassiveMultiplier",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "PassiveMultiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "PassiveMultiplier",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yoricksummonspectral"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yoricksummonravenous"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yoricksummondecayed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickraremovepet"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickultpetactive"
    }
  }
}
