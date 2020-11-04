NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "3144_Bilgewater_Cutlass.dds"
BuffName = "BilgewaterCutlass"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "Global_Slow.troy",
      Flags = 0,
      EffectIDVar = "slow",
      EffectIDVarTable = "InstanceVars",
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "slow",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      SrcVar = "MoveSpeedMod",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
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
      Value2 = "BilgewaterCutlass",
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
      Value2 = "BilgewaterCutlass",
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
      Value2 = "BilgewaterCutlass",
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
      Value2 = "BilgewaterCutlass",
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
      Value2 = "BilgewaterCutlass",
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
      Value2 = "BilgewaterCutlass",
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
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "TargetPos"}
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "PirateCutlass_cas.troy",
      Flags = 0,
      EffectIDVar = "CasterParticle",
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
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 150,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_DEFAULT,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = true,
      IgnoreDamageCrit = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = -0.5
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_Slow,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_slow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "piratecutlass_cas.troy"
    }
  }
}
