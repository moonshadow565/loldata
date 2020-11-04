NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "3154_WriggleLantern.dds"
BuffName = "WriggleLantern"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Value1 = 0.2, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_HERO},
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src1Value = 0,
                      Src2Value = 500,
                      DestVar = "DamageAmount",
                      MathOp = MO_ADD
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "SightWard",
      Skin = "SightWard",
      AiScript = "idle.lua",
      PosVar = "TargetPos",
      Team = TEAM_UNKNOWN,
      TeamVar = "TeamID",
      Stunned = true,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = false,
      Placemarker = false,
      VisibilitySize = 0,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Owner",
      BuffName = "WriggleLanternWard",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Invisibility,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 180,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Attacker",
      BuffName = "ItemPlacementMissile",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 7,
      SlotType = ExtraSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "ItemPlacementMissile",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Nothing",
      PosVar = "TargetPos",
      EndPosVar = "TargetPos",
      OverrideCastPosition = false,
      SlotNumber = 7,
      SlotType = ExtraSlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "NewCooldown",
      SrcValue = 180
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "name",
      Value2 = "wrigglelantern",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "NewCooldown",
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
      Value2 = "wrigglelantern",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "NewCooldown",
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
      Value2 = "wrigglelantern",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "NewCooldown",
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
      Value2 = "wrigglelantern",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "NewCooldown",
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
      Value2 = "wrigglelantern",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "NewCooldown",
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
      Value2 = "wrigglelantern",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 0,
          SrcVar = "NewCooldown",
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
    Params = {Name = "sightward"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "sightward"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wrigglelanternward"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemplacementmissile"
    }
  }
}
