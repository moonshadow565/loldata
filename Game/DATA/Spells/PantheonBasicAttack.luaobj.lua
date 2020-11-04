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
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Pantheon_CertainDeath"
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
                        Function = BBGetPAROrHealth,
                        Params = {
                          DestVar = "TarHP",
                          OwnerVar = "Target",
                          Function = GetHealthPercent,
                          PARType = PAR_MANA
                        }
                      },
                      {
                        Function = BBGetSlotSpellInfo,
                        Params = {
                          DestVar = "Level",
                          SpellSlotValue = 2,
                          SpellbookType = SPELLBOOK_CHAMPION,
                          SlotType = SpellSlots,
                          OwnerVar = "Owner",
                          Function = GetSlotSpellLevel
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {
                          DestVar = "hpThreshold",
                          SrcValueByLevel = {
                            0.15,
                            0.15,
                            0.15,
                            0.15,
                            0.15
                          }
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "TarHP",
                          Src2Var = "hpThreshold",
                          CompareOp = CO_LESS_THAN_OR_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBSetVarInTable,
                            Params = {DestVar = "HitResult", SrcValue = HIT_Critical}
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
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_DEFAULT,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_certaindeath"
    }
  }
}
