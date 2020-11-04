BuffTextureName = "33.dds"
BuffName = "AkaliTwinDisciplines"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AkaliAP",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "AkaliDmg",
      DestVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "AkaliAP",
      Src1VarTable = "InstanceVars",
      Value2 = 19.5,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "AkaliAP",
          DestVarTable = "NextBuffVars",
          SrcVar = "AkaliAP",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusDmgPerc",
          DestVarTable = "InstanceVars",
          SrcValue = 0.08
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AkaliAP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 20,
          DestVar = "AkaliAP",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AkaliAP",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 600,
          DestVar = "AddBonusDmgPerc",
          DestVarTable = "InstanceVars",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusDmgPerc",
          Src1VarTable = "InstanceVars",
          Src2Var = "AddBonusDmgPerc",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DmgMult",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "DmgMult",
          Src2VarTable = "InstanceVars",
          Src1Value = 100,
          Src2Value = 0,
          DestVar = "DmgMultTooltip",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "DmgMultTooltip",
          Index = 1
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AkaliTwinAP",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1.1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 0, Index = 1}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "AkaliDmg",
      Src1VarTable = "InstanceVars",
      Value2 = 9.5,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "AkaliDmg",
          DestVarTable = "NextBuffVars",
          SrcVar = "AkaliDmg",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseVampPercent",
          DestVarTable = "InstanceVars",
          SrcValue = 0.08
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AkaliDmg",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 10,
          DestVar = "AkaliDmg",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AkaliDmg",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 600,
          DestVar = "AdditionalVampPercent",
          DestVarTable = "InstanceVars",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseVampPercent",
          Src1VarTable = "InstanceVars",
          Src2Var = "AdditionalVampPercent",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "VampPercent",
          DestVarTable = "CharVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "VampPercent",
          Src2VarTable = "CharVars",
          Src1Value = 100,
          Src2Value = 0,
          DestVar = "VampPercentTooltip",
          DestVarTable = "InstanceVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "VampPercentTooltip",
          ValueVarTable = "InstanceVars",
          Index = 2
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AkaliTwinDmg",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1.1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetBuffToolTipVar,
        Params = {Value = 0, Index = 2}
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AkaliAP",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "AkaliDmg",
      DestVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalitwinap"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalitwindmg"
    }
  }
}
