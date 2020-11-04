NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
SpellDamageRatio = 1
TriggersSpellCasts = false
PopupMessage1 = "game_floatingtext_Slowed"
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Target",
      BuffName = "MissfortuneBulletHolder"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 7,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count1",
          TargetVar = "Target",
          BuffName = "MissFortuneWaveHold"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count1",
          Value2 = 1,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "MissFortuneWaveHold",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 2,
              NumberOfStacks = 1,
              Duration = 0.05,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "MissfortuneBulletHolder",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 9,
              NumberOfStacks = 1,
              Duration = 6,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BaseDamage",
              SrcValueByLevel = {
                65,
                95,
                125,
                185,
                230
              }
            }
          },
          {
            Function = BBGetTotalAttackDamage,
            Params = {
              TargetVar = "Owner",
              DestVar = "totalDamage"
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetBaseAttackDamage,
              TargetVar = "Owner",
              DestVar = "BaseAtkDmg"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "totalDamage",
              Src2Var = "BaseAtkDmg",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "BonusDamage",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "BonusDamage",
              Src1Value = 0.45,
              Src2Value = 0,
              DestVar = "BonusDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetFlatMagicDamageMod,
              TargetVar = "Owner",
              DestVar = "APPreMod"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "APPreMod",
              Src1Value = 0.2,
              Src2Value = 0,
              DestVar = "APPostMod",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BonusDamage",
              Src2Var = "APPostMod",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "ADAPBonus",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BaseDamage",
              Src2Var = "ADAPBonus",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "FinalDamage",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "FinalDamage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "missFortune_bulletTime_tar.troy",
              Flags = 0,
              EffectIDVar = "asdf",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
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
      Name = "missfortunewavehold"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "missfortunebulletholder"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_bullettime_tar.troy"
    }
  }
}
