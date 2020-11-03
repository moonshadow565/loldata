BuffTextureName = "XinZhao_TirelessWarrior.dds"
BuffName = "XenZhaoPuncture"
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_NOT_EQUAL
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
            Function = BBMath,
            Params = {
              Src1Var = "ComboCounter",
              Src1VarTable = "CharVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "ComboCounter",
              DestVarTable = "CharVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "ComboCounter",
              Src1VarTable = "CharVars",
              Value2 = 3,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ComboCounter",
                  DestVarTable = "CharVars",
                  SrcValue = 0
                }
              },
              {
                Function = BBGetLevel,
                Params = {TargetVar = "Owner", DestVar = "Level"}
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "HealAmount",
                  DestVarTable = "InstanceVars",
                  SrcValueByLevel = {
                    25,
                    25,
                    30,
                    30,
                    35,
                    35,
                    40,
                    40,
                    45,
                    45,
                    50,
                    50,
                    55,
                    55,
                    60,
                    60,
                    65,
                    65
                  }
                }
              },
              {
                Function = BBIncHealth,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  DeltaVar = "HealAmount",
                  DeltaVarTable = "InstanceVars",
                  HealerVar = "Owner"
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Attacker",
                  EffectName = "xenZiou_heal_passive.troy",
                  Flags = 0,
                  EffectIDVar = "num",
                  TargetObjectVar = "Attacker",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealAmount",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        25,
        25,
        30,
        30,
        35,
        35,
        40,
        40,
        45,
        45,
        50,
        50,
        55,
        55,
        60,
        60,
        65,
        65
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "HealAmount",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_heal_passive.troy"
    }
  }
}
