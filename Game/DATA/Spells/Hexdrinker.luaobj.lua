BuffTextureName = "3155_Hexdrinker.dds"
BuffName = "HexdrunkEmpowered"
AutoBuffActivateEffect = "hexTech_dmg_shield_duration.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ShieldHealth",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "HexdrinkerTimerCD",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 56,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "ShieldHealth",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageAmount",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DamageType",
          Value2 = MAGIC_DAMAGE,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "hexTech_dmg_shield_onHit_01.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "hexTech_dmg_shield_onHit_02.troy",
              Flags = 0,
              EffectIDVar = "b",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "ShieldHealth",
              Src1VarTable = "InstanceVars",
              Src2Var = "DamageAmount",
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "ShieldHealth",
                  Src1VarTable = "InstanceVars",
                  Src2Var = "DamageAmount",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "ShieldHealth",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageAmount",
                  SrcValue = 0
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src2Var = "ShieldHealth",
                  Src2VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageAmount",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ShieldHealth",
                  DestVarTable = "InstanceVars",
                  SrcValue = 0
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
      Name = "hexdrinkertimercd"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hextech_dmg_shield_onhit_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hextech_dmg_shield_onhit_02.troy"
    }
  }
}
