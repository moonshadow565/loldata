NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = false
BuffTextureName = "JarvanIV_GoldenAegis.dds"
BuffName = "JarvanIVGoldenAegis"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
OnPreDamagePriority = 3
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "JarvanGoldenAegis_buf.troy",
      Flags = 0,
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
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
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "Shield",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  },
  {
    Function = BBIncreaseShield,
    Params = {
      UnitVar = "Owner",
      AmountVar = "Shield",
      AmountVarTable = "InstanceVars",
      Amount = 0,
      MagicShield = true,
      PhysicalShield = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Shield",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBRemoveShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "Shield",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "oldArmorAmount",
      DestVarTable = "InstanceVars",
      SrcVar = "Shield",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Shield",
      Src1VarTable = "InstanceVars",
      Src2Var = "DamageAmount",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "Shield",
          Src1VarTable = "InstanceVars",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "Shield",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValue = 0
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "oldArmorAmount",
          Src1VarTable = "InstanceVars",
          Src2Var = "Shield",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "oldArmorAmount",
          DestVarTable = "InstanceVars",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBReduceShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "oldArmorAmount",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "Shield",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Shield",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      },
      {
        Function = BBReduceShield,
        Params = {
          UnitVar = "Owner",
          AmountVar = "oldArmorAmount",
          AmountVarTable = "InstanceVars",
          Amount = 0,
          MagicShield = true,
          PhysicalShield = true
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "Shield",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  }
}
SelfExecuteBuildingBlocks = {
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
      DestVar = "ShieldAmount",
      SrcValueByLevel = {
        50,
        100,
        150,
        200,
        250
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ShieldBonus",
      SrcValueByLevel = {
        20,
        25,
        30,
        35,
        40
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 500,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusShield",
          Src2Var = "ShieldBonus",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BonusShield",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ShieldAmount",
      Src2Var = "BonusShield",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Shield",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Shield",
      DestVarTable = "NextBuffVars",
      SrcVar = "Shield"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        -0.15,
        -0.2,
        -0.25,
        -0.3,
        -0.35
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "JarvanGoldenAegis_nova.troy",
      Flags = 0,
      EffectIDVar = "a",
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
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 500,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "Slow",
          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
          StacksExclusive = true,
          BuffType = BUFF_Slow,
          MaxStack = 100,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "JarvanGoldenAegis_tar.troy",
          Flags = 0,
          EffectIDVar = "asdf",
          BoneName = "spine",
          TargetObjectVar = "Unit",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvangoldenaegis_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvangoldenaegis_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvangoldenaegis_tar.troy"
    }
  }
}
