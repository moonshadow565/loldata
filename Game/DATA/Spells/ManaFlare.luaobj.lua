NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoCooldownByLevel = {
  16,
  14,
  12,
  10,
  8
}
SetSpellDamageRatio = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DrainPercent",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DrainedBool",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaRestore",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DrainedBool",
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
BuffOnDealDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DrainedBool",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DrainedBool",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  }
}
BuffOnKillBuildingBlocks = {
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_MANA,
      DeltaVar = "ManaRestore",
      DeltaVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "permission_mana_gain.troy",
      Flags = 0,
      BoneName = "pelvis",
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "Mana",
      OwnerVar = "Target",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TotalDamage",
      SrcValueByLevel = {
        200,
        300,
        400
      }
    }
  },
  {
    Function = BBIfPARTypeEquals,
    Params = {OwnerVar = "Target", PARType = PAR_MANA},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Mana",
          Src1Value = 0,
          Src2Value = 0.25,
          DestVar = "BonusDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusDamage",
          Src2Var = "TotalDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TotalDamage",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "NoManaBonusDamage",
          SrcValueByLevel = {
            75,
            150,
            225
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "NoManaBonusDamage",
          Src2Var = "TotalDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TotalDamage",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaRestore",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        500,
        1000,
        1500
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DrainPercent",
      DestVarTable = "NextBuffVars",
      SrcValue = 1
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DrainedBool",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.01,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "Shadowbolt",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "TotalDamage",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 1.2,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "permission_mana_gain.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "shadowbolt"}
  }
}
