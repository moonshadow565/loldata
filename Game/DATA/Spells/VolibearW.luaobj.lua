NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "DrMundo_Masochism.dds"
BuffName = "VolibearWBuff"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
PersistsThroughDeath = true
TriggersSpellCasts = true
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
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "VolibearWAS",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                0.08,
                0.11,
                0.14,
                0.17,
                0.2
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "VolibearWStats",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 3,
              NumberOfStacks = 1,
              Duration = 4.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Attacker",
              BuffName = "VolibearWStats"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 3,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Attacker",
                  AttackerVar = "Attacker",
                  BuffName = "VolibearWParticle",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 4,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = true
                }
              }
            }
          },
          {
            Function = BBUpdateCanCast,
            Params = {TargetVar = "Attacker"}
          }
        }
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBSetReturnValue,
    Params = {SrcValue = false}
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "VolibearWStats"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DebuffFound",
      SrcValue = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "VolibearW_tar.troy",
      EffectNameForOtherTeam = "VolibearW_tar.troy",
      Flags = 0,
      EffectIDVar = "Part1",
      EffectID2Var = "Part2",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      SpecificTeamOnlyOverrideVar = "TeamID",
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
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      SrcValueByLevel = {
        90,
        140,
        190,
        240,
        290
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatHPPoolMod,
      TargetVar = "Attacker",
      DestVar = "HPPoolMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HPPoolMod",
      Src1Value = 0,
      Src2Value = 0.2,
      DestVar = "HPPoolMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HPPoolMod",
      Src2Var = "Damage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Damage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxHP",
      OwnerVar = "Target",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurrentHP",
      OwnerVar = "Target",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxHP",
      Src2Var = "CurrentHP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MissingHP",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MissingHP",
      Src2Var = "MaxHP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MissingHPPerc",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MissingHPPerc",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "MissingHPPerc",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MissingHPPerc",
      Src2Var = "Damage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Damage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "Damage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwstats"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwdebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwdebuffchaos"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibearw_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearwdrain"
    }
  }
}
