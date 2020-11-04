NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DoFlurry",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DoFist",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DoWay",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Attacker",
      Damage = 99999,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoFlurry",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "tempLevel",
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
          DestVar = "DoFlurry",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Attacker",
          TargetVar = "Nothing",
          PosVar = "Attacker",
          EndPosVar = "Attacker",
          SlotNumber = 0,
          SlotType = SpellSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "tempLevel",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoFist",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DoFist",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BonusDamage",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            15,
            30,
            45,
            60,
            75
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "StunLength",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            1,
            1,
            1,
            1,
            1
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "NextBuffVars",
          SrcValue = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "IronFist",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoWay",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DoWay",
          DestVarTable = "InstanceVars",
          SrcValue = false
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "WayOfAgilityCritical"
        },
        SubBlocks = {
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Attacker",
              ToSay = "game_lua_UnleashTheBeast_dodge"
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "WayOfAgilityCritical"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "WayOfAgilityDodge",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Haste,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 9999,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBDebugSay,
            Params = {OwnerVar = "Attacker", ToSay = "Pokey!"}
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "WayOfAgilityDodge"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "WayOfAgilityCritical",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Haste,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 9999,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "TempName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TempName",
      Value2 = "Flurry",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DoFlurry",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  }
}
BuffOnSpellHitBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "TempName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TempName",
      Value2 = "IronFist",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DoFist",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TempName",
      Value2 = "WayOfAgility",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DoWay",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBCloneUnitPet,
    Params = {
      UnitToCloneVar = "Owner",
      Buff = "BeastMarker",
      Duration = 40,
      PosVar = "TargetPos",
      HealthBonus = 0,
      DamageBonus = 0,
      DestVar = "Unit"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DoFlurry",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DoFist",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DoWay",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Unit",
      BuffName = "UnleashTheBeast",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 60,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "WayOfAgilityCritical"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Unit",
          BuffName = "WayOfAgilityCritical",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Haste,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 9999,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "WayOfAgilityDodge"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Unit",
          BuffName = "WayOfAgilityDodge",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Haste,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 9999,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "ironfist"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wayofagilitycritical"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wayofagilitydodge"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "beastmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unleashthebeast"
    }
  }
}
