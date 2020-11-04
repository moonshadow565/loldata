BuffTextureName = "Minotaur_ColossalStrength.dds"
BuffName = "APBonusDamageToTowers"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "ForitfyCheck",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ForitfyCheck",
      Value2 = "SummonerFortify",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FortifyCheck",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 3,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "ForitfyCheck2",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ForitfyCheck2",
      Value2 = "SummonerFortify",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FortifyCheck",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 3,
          CanMitigateDuration = false
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
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
        Function = BBMath,
        Params = {
          Src1Var = "AbilityPower",
          Src1Value = 0,
          Src2Value = 2.5,
          DestVar = "AbilityDamageToAdd",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatPhysicalDamageMod,
          TargetVar = "Owner",
          DestVar = "BonusAttackPower"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "BonusAttackPower",
          Src2Var = "AbilityDamageToAdd",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "BonusAttackPower",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src2Var = "AbilityDamageToAdd",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_ADD
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
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_AI},
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
            Function = BBMath,
            Params = {
              Src1Var = "AbilityPower",
              Src1Value = 0,
              Src2Value = 2.5,
              DestVar = "AbilityDamageToAdd",
              MathOp = MO_DIVIDE
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetFlatPhysicalDamageMod,
              TargetVar = "Owner",
              DestVar = "BonusAttackPower"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "BonusAttackPower",
              Src2Var = "AbilityDamageToAdd",
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src2Var = "BonusAttackPower",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageAmount",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src2Var = "AbilityDamageToAdd",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageAmount",
                  MathOp = MO_ADD
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
      Name = "fortifycheck"
    }
  }
}
