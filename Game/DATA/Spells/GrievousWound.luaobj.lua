BuffTextureName = "GW_Debuff.dds"
BuffName = "GrievousWound"
AutoBuffActivateEffect = "Global_Mortal_Strike.troy"
AutoBuffActivateAttachBoneName = "Head"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentLifeStealMod,
      TargetVar = "Owner",
      DestVar = "lifeStealMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "lifeStealMod",
      Src1Value = 0,
      Src2Value = -0.5,
      DestVar = "lifeStealMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentSpellBlockMod,
      TargetVar = "Owner",
      DestVar = "spellVampMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "spellVampMod",
      Src1Value = 0,
      Src2Value = -0.5,
      DestVar = "spellVampMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Internal_50MS"
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentHPRegenMod,
          TargetVar = "Owner",
          Delta = -0.5
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentLifeStealMod,
          TargetVar = "Owner",
          DeltaVar = "lifeStealMod",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentSpellVampMod,
          TargetVar = "Owner",
          DeltaVar = "spellVampMod",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  }
}
BuffOnHealBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Internal_50MS"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Health",
          Value2 = 0,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Health",
              Src1Value = 0,
              Src2Value = 0.5,
              DestVar = "EffectiveHeal",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetReturnValue,
            Params = {
              SrcVar = "EffectiveHeal"
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentLifeStealMod,
      TargetVar = "Owner",
      DestVar = "lifeStealMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "lifeStealMod",
      Src2Var = "lifeStealMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "lifeStealMod",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "lifeStealMod",
      Src1Value = 0,
      Src2Value = -0.5,
      DestVar = "lifeStealMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentSpellBlockMod,
      TargetVar = "Owner",
      DestVar = "spellVampMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "spellVampMod",
      Src2Var = "spellVampMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "spellVampMod",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "spellVampMod",
      Src1Value = 0,
      Src2Value = -0.5,
      DestVar = "spellVampMod",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_50ms"
    }
  }
}
