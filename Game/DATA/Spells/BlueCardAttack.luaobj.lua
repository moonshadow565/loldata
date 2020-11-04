TargetExecuteBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Attacker",
      DestVar = "baseDamage"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "baseDamage",
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
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "PickACard"
        }
      },
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
                  Stat = GetFlatMagicDamageMod,
                  TargetVar = "Attacker",
                  DestVar = "baseAP"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BonusDamage",
                  SrcValueByLevel = {
                    40,
                    60,
                    80,
                    100,
                    120
                  }
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "baseAP",
                  Src1Value = 0,
                  Src2Value = 0.4,
                  DestVar = "baseAP",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "baseAP",
                  Src2Var = "BonusDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "BlueCardDamage",
                  MathOp = MO_ADD
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
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Target"}
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "BlueCardDamage",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
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
                  Src1Var = "BlueCardDamage",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "ManaToRestore",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ManaToRestore",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "ManaToRestore"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "CardmasterBlueCardMana",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.1,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
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
    Params = {Name = "pickacard"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cardmasterbluecardmana"
    }
  }
}
