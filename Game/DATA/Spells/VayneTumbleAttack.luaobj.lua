TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatCritChanceMod,
      TargetVar = "Attacker",
      DestVar = "CritChance"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "scalingDamage",
      SrcValueByLevel = {
        0.55,
        0.6,
        0.65,
        0.7,
        0.75
      }
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {
      TargetVar = "Owner",
      DestVar = "BaseAttackDamage"
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "HitResult", SrcValue = HIT_Normal}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageVar",
              SrcVar = "BaseAttackDamage"
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
            Params = {Src1Var = "CritChance", CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "HitResult", SrcValue = HIT_Critical}
              },
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetFlatCritDamageMod,
                  TargetVar = "Attacker",
                  DestVar = "CritDamage"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "CritDamage",
                  Src1Value = 0,
                  Src2Value = 2,
                  DestVar = "CritDamage",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "scalingDamage",
                  Src2Var = "CritDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "scalingDamage",
                  MathOp = MO_DIVIDE
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
                Params = {DestVar = "HitResult", SrcValue = HIT_Normal}
              }
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "scalingDamage",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "scalingDamage",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BaseAttackDamage",
              Src2Var = "scalingDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageVar",
              MathOp = MO_MULTIPLY
            }
          }
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
        Params = {DestVar = "HitResult", SrcValue = HIT_Normal}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageVar",
          SrcVar = "BaseAttackDamage"
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
      Damage = 0,
      DamageVar = "DamageVar",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              PosVar = "Owner",
              EffectName = "vayne_Q_tar.troy",
              Flags = 0,
              EffectIDVar = "hi",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_NEUTRAL,
              FOWVisibilityRadius = 200,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VayneTumbleBonus",
              ResetDuration = 0
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VayneTumbleFade",
              ResetDuration = 0
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
      Name = "vayne_q_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynetumblebonus"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynetumblefade"
    }
  }
}
