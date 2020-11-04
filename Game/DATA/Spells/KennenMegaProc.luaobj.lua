TargetExecuteBuildingBlocks = {
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Owner",
                      BuffName = "KennenMarkofStorm",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatDehancer,
                      MaxStack = 5,
                      NumberOfStacks = 1,
                      Duration = 12,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0
                    }
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
                      DestVar = "DamageMod",
                      SrcValueByLevel = {
                        0.4,
                        0.5,
                        0.6,
                        0.7,
                        0.8
                      }
                    }
                  },
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
                      Src2Var = "DamageMod",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "ProcDamage",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "AttackDamage",
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
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "ProcDamage",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
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
                      BuffName = "KennenDoubleStrikeLive"
                    }
                  },
                  {
                    Function = BBRemoveOverrideAutoAttack,
                    Params = {OwnerVar = "Owner", CancelAttack = true}
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "Count",
                      DestVarTable = "CharVars",
                      SrcValue = 0
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
      Name = "kennenmarkofstorm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennendoublestrikelive"
    }
  }
}
