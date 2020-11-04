NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "PoppyDevastatingBlow.dds"
BuffName = "PoppyDevastatingBlow"
AutoBuffActivateEffect = "Poppy_DevastatingBlow_buf.troy"
AutoBuffActivateAttachBoneName = "hammer_b"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
ChainMissileParameters = {
  MaximumHits = {
    4,
    4,
    4,
    4,
    4
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellCooldown",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
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
      SpellSlotValue = 0,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
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
      DestVar = "MaxDamage",
      SrcValueByLevel = {
        75,
        150,
        225,
        300,
        375
      }
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
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "TarMaxHealth",
              OwnerVar = "Target",
              Function = GetMaxHealth,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TarMaxHealth",
              Src1Value = 0,
              Src2Value = 0.08,
              DestVar = "TarMaxHealth",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TarMaxHealth",
              Src2Var = "BonusDamage",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageToDeal",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageToDeal",
              Src2Var = "MaxDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageToDeal",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "Poppy_DevastatingBlow_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageToDeal",
              Src2Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageToDeal",
              MathOp = MO_ADD
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
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageToDeal",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.6,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "PoppyDevastatingBlow"
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
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        8,
        7,
        6,
        5,
        4
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        20,
        40,
        60,
        80,
        100
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
      SpellSlotValue = 0,
      OwnerVar = "Owner"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "poppy_devastatingblow_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppydevastatingblow"
    }
  }
}
