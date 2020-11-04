PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AegisCounter",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "AegisCounter",
      Src1VarTable = "InstanceVars",
      Value2 = 4,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Pantheon_AegisShield",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "AegisCounter",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      }
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Pantheon_AegisShield"
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "AegisCounter",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "AegisCounter",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Pantheon_AegisShield"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Miss,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "HitResult",
              Value2 = HIT_Dodge,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "AegisCounter",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "AegisCounter",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_ADD
                }
              }
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
    Params = {
      Name = "pantheon_aegisshield"
    }
  }
}
