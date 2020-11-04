BuffTextureName = "MissFortune_ImpureShots.dds"
BuffName = "MissFortunePassive"
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
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
      DestVar = "DamageCounter",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        6,
        8,
        10,
        12,
        14
      }
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MissFortunePassive",
      RequiredVarTable = "InstanceVars"
    }
  }
}
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
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
                SubBlocks = {
                  {
                    Function = BBGetStat,
                    Params = {
                      Stat = GetFlatMagicDamageMod,
                      TargetVar = "Owner",
                      DestVar = "APMod"
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "APMod",
                      Src1Value = 0,
                      Src2Value = 0.05,
                      DestVar = "ModdedDmg",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "ModdedDmg",
                      Src2Var = "DamageCounter",
                      Src2VarTable = "InstanceVars",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "PreCount",
                      MathOp = MO_ADD
                    }
                  },
                  {
                    Function = BBGetTeamID,
                    Params = {TargetVar = "Owner", DestVar = "TeamID"}
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "MissFortunePassiveStack",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = false,
                      BuffType = BUFF_CombatDehancer,
                      MaxStack = 4,
                      NumberOfStacks = 1,
                      Duration = 5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  },
                  {
                    Function = BBGetBuffCountFromAll,
                    Params = {
                      DestVar = "Count",
                      TargetVar = "Target",
                      BuffName = "MissFortunePassiveStack"
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "PreCount",
                      Src2Var = "Count",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "DamageDealt",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Owner",
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "DamageDealt",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_PROC,
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
                      EffectName = "missFortune_passive_tar_indicator.troy",
                      Flags = 0,
                      EffectIDVar = "asdf",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true
                    }
                  }
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
      Name = "missfortunepassivestack"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "missfortune_passive_tar_indicator.troy"
    }
  }
}
