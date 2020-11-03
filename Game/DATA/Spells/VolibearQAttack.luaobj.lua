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
      DestVar = "BonusDamage",
      SrcValueByLevel = {
        25,
        50,
        75,
        100,
        125
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
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
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
                  Src1Var = "BonusDamage",
                  Src2Var = "CritDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "BonusDamage",
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
      Src1Var = "BaseAttackDamage",
      Src2Var = "BonusDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageVar",
      MathOp = MO_ADD
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
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VolibearQ",
      ResetDuration = 0
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Target"}
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "Volibear_Q_tar.troy",
              Flags = 0,
              EffectIDVar = "Kennenss",
              BoneName = "C_BUFFBONE_GLB_CENTER_LOC",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Attacker",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BouncePos",
              DestVarTable = "NextBuffVars",
              SrcVar = "BouncePos",
              SrcVarTable = "CharVars"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "VolibearQExtra",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = true
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
      Name = "volibear_q_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearqextra"
    }
  }
}
