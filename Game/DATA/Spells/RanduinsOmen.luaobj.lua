PersistsThroughDeath = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentCooldownMod,
      TargetVar = "Owner",
      Delta = -0.15
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentCooldownMod,
      TargetVar = "Owner",
      Delta = 0.15
    }
  }
}
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Value1 = 0.2, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MoveSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValue = -0.35
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "AttackSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValue = -0.35
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Owner",
              BuffName = "Slow",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
              StacksExclusive = true,
              BuffType = BUFF_Slow,
              MaxStack = 100,
              NumberOfStacks = 1,
              Duration = 3,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "pantheon_grandskyfall_land.troy",
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = -0.35
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = -0.35
    }
  },
  {
    Function = BBGetArmor,
    Params = {TargetVar = "Owner", DestVar = "CastArmor"}
  },
  {
    Function = BBGetSpellBlock,
    Params = {TargetVar = "Owner", DestVar = "CastMR"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CastArmor",
      Src2Var = "CastMR",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DefTotal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DefTotal",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "DefTotal",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DefTotal",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "DefTotal",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DefTotal",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "FinalSlow",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 500,
      Flags = "AffectEnemies AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "Slow",
          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
          StacksExclusive = true,
          BuffType = BUFF_Slow,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "FinalSlow",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "BlackOmen",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationVar = "FinalSlow",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "name",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "name1",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "name2",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "name3",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "name4",
      SpellSlotValue = 4,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "name5",
      SpellSlotValue = 5,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "name",
      Value2 = "YoumusBlade",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 60,
          SlotNumber = 0,
          SlotType = InventorySlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "name1",
      Value2 = "YoumusBlade",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 60,
          SlotNumber = 1,
          SlotType = InventorySlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "name2",
      Value2 = "YoumusBlade",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 60,
          SlotNumber = 2,
          SlotType = InventorySlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "name3",
      Value2 = "YoumusBlade",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 60,
          SlotNumber = 3,
          SlotType = InventorySlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "name4",
      Value2 = "YoumusBlade",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 60,
          SlotNumber = 4,
          SlotType = InventorySlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "name5",
      Value2 = "YoumusBlade",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 60,
          SlotNumber = 5,
          SlotType = InventorySlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pantheon_grandskyfall_land.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "blackomen"}
  }
}
