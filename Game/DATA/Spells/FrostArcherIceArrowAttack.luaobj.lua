NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "3022_Frozen_Heart.dds"
BuffName = "FrostArrow"
AutoBuffActivateEffect = "Global_Freeze.troy"
TriggersSpellCasts = false
OnBuffActivateBuildingBlocks = {
  {
    Function = BBDebugSay,
    Params = {
      OwnerVar = "Owner",
      ToSay = "applicator activatre"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
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
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MovementSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                -0.1,
                -0.2,
                -0.3,
                -0.4,
                -0.5
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "AttackSpeedMod",
              DestVarTable = "NextBuffVars",
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "FrostArrow",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBDebugSay,
    Params = {OwnerVar = "Owner", ToSay = "execute"}
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBDebugSay,
            Params = {OwnerVar = "Owner", ToSay = "add buff"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0.1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
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
      DestVar = "BaseAttackDamage"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseAttackDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_ATTACK,
      PercentOfAttack = 1,
      SpellDamageRatio = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "frostarrow"}
  }
}
