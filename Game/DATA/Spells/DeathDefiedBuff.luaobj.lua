BuffTextureName = "Lich_Defied.dds"
BuffName = "Death Defied Buff"
PersistsThroughDeath = true
NonDispellable = true
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "COTGFound",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "itemCD1",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Nothing",
      BuffName = "MordekaiserChildrenOfTheGrave"
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "mordekeiser_cotg_tar.troy",
          Flags = 0,
          EffectIDVar = "MordekaiserParticle",
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "COTGFound",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetTargetable
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "mordekeiser_cotg_skin.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = true,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBStopChanneling,
    Params = {
      CasterVar = "Owner",
      StopCondition = ChannelingStopCondition_Cancel,
      StopSource = ChannelingStopSource_Die
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 4,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 5,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBShowHealthBar,
    Params = {UnitVar = "Owner", Show = false}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Suppression}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Blind}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Poison}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_CombatDehancer}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Stun}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Invisibility}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Silence}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Snare}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Slow}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Polymorph}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Taunt}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Damage}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Haste}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Fear}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Sleep}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Net}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Heal}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Sleep}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Invulnerability}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_PhysicalImmunity}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_SpellImmunity}
  },
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
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "cost0",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            20,
            26,
            32,
            38,
            44
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "cost0",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "cost0ToInc",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 0,
          SlotType = SpellSlots,
          Cost = 0,
          CostVar = "cost0ToInc",
          PARType = PAR_MANA
        }
      }
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
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "cost2",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            30,
            42,
            54,
            66,
            78
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "cost2",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "cost2ToInc",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 2,
          SlotType = SpellSlots,
          Cost = 0,
          CostVar = "cost2ToInc",
          PARType = PAR_MANA
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "cost3",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            150,
            175,
            200
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "cost3",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "cost3ToInc",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 3,
          SlotType = SpellSlots,
          Cost = 0,
          CostVar = "cost3ToInc",
          PARType = PAR_MANA
        }
      }
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 1,
      SlotType = SpellSlots,
      Cost = -100,
      PARType = PAR_MANA
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetTargetable
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "COTGFound",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "MordekaiserParticle",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 25000,
          Flags = "AffectEnemies AffectHeroes ",
          IteratorVar = "Unit",
          BuffNameFilter = "MordekaiserIronMan",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Unit",
              TargetVar = "Owner",
              PosVar = "Owner",
              EndPosVar = "Owner",
              OverrideCastPosition = false,
              SlotNumber = 0,
              SlotType = ExtraSlots,
              OverrideForceLevel = 1,
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
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 4,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 5,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = InventorySlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBShowHealthBar,
    Params = {UnitVar = "Owner", Show = true}
  },
  {
    Function = BBForceDead,
    Params = {OwnerVar = "Owner"}
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Defile"
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 0,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 1,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 2,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBSetPARCostInc,
    Params = {
      SpellSlotOwnerVar = "Owner",
      SpellSlot = 3,
      SlotType = SpellSlots,
      Cost = 0,
      PARType = PAR_MANA
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetTargetable
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "LifeTime",
      Value2 = 4.5,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      }
    }
  }
}
BuffOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 0,
      CompareOp = CO_EQUAL
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
          DestVar = "cost0",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            20,
            26,
            32,
            38,
            44
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "cost0",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "costInc",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 0,
          SlotType = SpellSlots,
          Cost = 0,
          CostVar = "costInc",
          PARType = PAR_MANA
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
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
          DestVar = "cost2",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            30,
            42,
            54,
            66,
            78
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "cost2",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "costInc",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 2,
          SlotType = SpellSlots,
          Cost = 0,
          CostVar = "costInc",
          PARType = PAR_MANA
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "cost3",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            150,
            175,
            200
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "cost3",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "costInc",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetPARCostInc,
        Params = {
          SpellSlotOwnerVar = "Owner",
          SpellSlot = 3,
          SlotType = SpellSlots,
          Cost = 0,
          CostVar = "costInc",
          PARType = PAR_MANA
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageAmount",
      SrcValue = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaiserchildrenofthegrave"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordekeiser_cotg_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordekeiser_cotg_skin.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaiserironman"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "defile"}
  }
}
