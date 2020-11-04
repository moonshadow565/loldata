NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Blitzcrank_PowerFist.dds"
BuffName = "PowerFist"
AutoBuffActivateEffect = "Powerfist_buf.troy"
AutoBuffActivateAttachBoneName = "R_hand"
AutoBuffActivateEffect2 = "Powerfist_buf.troy"
AutoBuffActivateAttachBoneName2 = "L_hand"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellCooldown",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = true}
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = true}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      SrcVar = "SpellCooldown",
      SrcVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "SpellCooldown",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "NewCooldown",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 2,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = false}
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseAttackDamage"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "BaseAttackDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      MathOp = MO_ADD
    }
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
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Target"}
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "PowerFistSlow",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
              StacksExclusive = true,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Owner",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageToDeal",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_DEFAULT,
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
              Src1Var = "DamageAmount",
              Src2Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageAmount",
              MathOp = MO_SUBTRACT
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "PowerFist"
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        9,
        8,
        7,
        6,
        5
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 2,
      OwnerVar = "Owner"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "powerfistslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "powerfist"}
  }
}
