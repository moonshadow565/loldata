DoesntBreakShields = true
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "HealthCost",
      SrcValueByLevel = {
        0,
        0,
        0,
        0,
        0
      }
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "Temp1",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "HealthCost",
      Src2Var = "Temp1",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Temp1",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "HealthCost",
          MathOp = MO_SUBTRACT
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthCost",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "HealthCost",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealthCost",
      HealerVar = "Owner"
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Target",
      BuffName = "SpellShield"
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Target"}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Target",
          AttackerVar = "Target",
          BuffName = "BansheesVeil"
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Target"}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Nothing",
              BuffName = "BlackShield"
            },
            SubBlocks = {
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Target"}
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  DamageByLevel = {
                    70,
                    115,
                    160,
                    205,
                    250
                  },
                  Damage = 0,
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.6,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Attacker",
                  TargetVar = "Owner",
                  PosVar = "Attacker",
                  EndPosVar = "Owner",
                  OverrideCastPosition = true,
                  OverrideCastPosVar = "TargetPos",
                  SlotNumber = 1,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 0,
                  OverrideForceLevelVar = "Level",
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = true,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = false,
                  UpdateAutoAttackTimer = false
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
      Name = "spellshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bansheesveil"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blackshield"
    }
  }
}
