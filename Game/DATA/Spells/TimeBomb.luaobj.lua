NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Chronokeeper_Chronoblast.dds"
BuffName = "Time Bomb"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageLevel",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Attacker",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamOfOwner",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "TimeBomb_red.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "TimeBomb_green.troy",
          Flags = 0,
          EffectIDVar = "ParticleID2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "TimeBomb_red.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "TimeBomb_green.troy",
          Flags = 0,
          EffectIDVar = "ParticleID2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "ActivateTime",
      SecondsVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TickDamage",
      DestVarTable = "InstanceVars",
      SrcValue = 3
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "DeactivateTime"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DeactivateTime",
      Src2Var = "ActivateTime",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "BuffDuration",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "BuffDuration",
      Value2 = 4,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "TimeBombExplo.troy",
          Flags = 0,
          EffectIDVar = "par",
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
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Owner",
          Range = 350,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DamageLevel",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.9,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "Owner",
          EffectName = "TimeBombExplo.troy",
          Flags = 0,
          EffectIDVar = "par",
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
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Owner",
          Range = 350,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DamageLevel",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.9,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
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
      DestVar = "DamageLevel",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        100,
        155,
        210,
        270,
        330
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Owner",
      BuffName = "TimeBomb"
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "TimeBombExplo.troy",
          Flags = 0,
          EffectIDVar = "par",
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
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Target",
          Range = 350,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DamageLevel",
              DamageVarTable = "NextBuffVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 1.1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Damage,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 1,
      CanMitigateDuration = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "TickDamage",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Damage = 0,
              DamageVar = "TickDamage",
              DamageVarTable = "InstanceVars",
              DamageType = TRUE_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TickDamage",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "TickDamage",
              DestVarTable = "InstanceVars",
              MathOp = MO_SUBTRACT
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "timebomb_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "timebomb_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "timebombexplo.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "timebomb"}
  }
}
