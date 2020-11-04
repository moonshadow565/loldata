BuffTextureName = "3021_Fleshrender.dds"
BuffName = "HexdrunkEmpowered"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StatBoost",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StatBoost",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "StatBoost",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "StatBoost",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = MAGIC_DAMAGE,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DamageAmount",
          Value2 = 0,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 0.041667,
              DestVar = "StatBoostInc",
              DestVarTable = "InstanceVars",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "StatBoost",
              Src1VarTable = "InstanceVars",
              Src2Var = "StatBoostInc",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "StatBoost",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "StatBoost",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 25,
              DestVar = "StatBoost",
              DestVarTable = "InstanceVars",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "StatBoost",
              DestVarTable = "NextBuffVars",
              SrcVar = "StatBoost",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Hexdrinker",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 8,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "hexdrinker"}
  }
}
