NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Jester_IncrediblyPrecise.dds"
BuffName = "Two Shiv Poison"
AutoBuffActivateEffect = "global_slow.troy"
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MissChance",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO}
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatMissChanceMod,
          TargetVar = "Owner",
          DeltaVar = "MissChance",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "AttackDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackDamage",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "AttackDamageMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BackstabBonus",
      SrcValue = 0
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "CastFromBehind"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BackstabBonus",
          SrcValue = 0.2
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Target",
          CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Target",
              Src2Var = "Owner",
              CompareOp = CO_IS_TARGET_BEHIND_ME
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BackstabBonus",
                  SrcValue = 0.2
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        40,
        80,
        120,
        160,
        200
      },
      Damage = 0,
      DamageVar = "AttackDamageMod",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      PercentOfAttackVar = "BackstabBonus",
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.2,
        -0.225,
        -0.25,
        -0.275,
        -0.3
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MissChance",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.2,
        0.225,
        0.25,
        0.275,
        0.3
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "TwoShivPoison",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "castfrombehind"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "twoshivpoison"
    }
  }
}
