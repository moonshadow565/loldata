NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoCooldownByLevel = {
  0,
  0,
  0,
  0,
  0
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        40,
        65,
        90
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.2,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "swain_heal.troy",
      Flags = 0,
      EffectIDVar = "ar",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Target",
      CasterVar = "Nothing",
      BuffName = "BlackShield"
    },
    SubBlocks = {
      {
        Function = BBGetStatus,
        Params = {
          TargetVar = "Attacker",
          DestVar = "IsTargetable",
          Status = GetTargetable
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsTargetable",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
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
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BaseHeal",
              SrcValue = 0,
              SrcValueByLevel = {
                20,
                30,
                40,
                0,
                0
              }
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetFlatMagicDamageMod,
              TargetVar = "Attacker",
              DestVar = "AbilityPower"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "AbilityPower",
              Src1Value = 0,
              Src2Value = 0.1,
              DestVar = "AbilityPowerMod",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "AbilityPowerMod",
              Src2Var = "BaseHeal",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TotalHeal",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Attacker",
              Delta = 0,
              DeltaVar = "TotalHeal",
              HealerVar = "Attacker"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "swain_heal.troy",
              Flags = 0,
              EffectIDVar = "ar",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
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
      Name = "swain_heal.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "blackshield"
    }
  }
}
