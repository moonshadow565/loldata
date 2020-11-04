NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
TargetExecuteBuildingBlocks = {
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
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
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
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
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
                    Function = BBGetStat,
                    Params = {
                      Stat = GetFlatMagicDamageMod,
                      TargetVar = "Owner",
                      DestVar = "AbilityPower"
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "MaxHealthDamage",
                      SrcValueByLevel = {
                        0.02,
                        0.03,
                        0.04,
                        0.05,
                        0.06
                      }
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src2Var = "AbilityPower",
                      Src1Value = 1.0E-4,
                      Src2Value = 0,
                      DestVar = "BonusMaxHealthDamage",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "BonusMaxHealthDamage",
                      Src2Var = "MaxHealthDamage",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "TotalMaxHealthDamage",
                      MathOp = MO_ADD
                    }
                  },
                  {
                    Function = BBGetPAROrHealth,
                    Params = {
                      DestVar = "MaxHealth",
                      OwnerVar = "Target",
                      Function = GetMaxHealth,
                      PARType = PAR_MANA
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "MaxHealth",
                      Src2Var = "TotalMaxHealthDamage",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "DamageToApply",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBGetTeamID,
                    Params = {TargetVar = "Target", DestVar = "TeamId"}
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "TeamId",
                      Value2 = TEAM_NEUTRAL,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBMath,
                        Params = {
                          Src2Var = "DamageToApply",
                          Src1Value = 100,
                          Src2Value = 0,
                          DestVar = "DamageToApply",
                          MathOp = MO_MIN
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
                      DamageVar = "DamageToApply",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_PROC,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
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
