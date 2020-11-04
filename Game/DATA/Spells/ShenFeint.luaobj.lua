NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Shen_Feint.dds"
BuffName = "Shen Feint Buff"
AutoBuffActivateEffect = "shen_Feint_self.troy"
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageBlock",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "willRemove",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "willRemove",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "shen_Feint_self_deactivate.troy",
          Flags = 0,
          EffectIDVar = "ar",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "willRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
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
      Src1Var = "DamageBlock",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "saveDmgAmount",
              SrcVar = "DamageAmount"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "DamageBlock",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_MAX
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageBlock",
              Src1VarTable = "InstanceVars",
              Src2Var = "saveDmgAmount",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageBlock",
              DestVarTable = "InstanceVars",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "shen_Feint_block.troy",
              Flags = 0,
              EffectIDVar = "ar",
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "willRemove",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "baseDamageBlock",
      SrcValueByLevel = {
        50,
        115,
        180,
        245,
        310
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.3,
      DestVar = "BonusHealth",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "baseDamageBlock",
      Src2Var = "BonusHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageBlock",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageBlock",
      DestVarTable = "NextBuffVars",
      SrcVar = "DamageBlock"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        2,
        2,
        2,
        2,
        2
      },
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_feint_self_deactivate.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shen_feint_block.troy"
    }
  }
}
