NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Cryophoenix_FrigidOrb.dds"
BuffName = "Flash Frost"
SpellToggleSlot = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetType = TTYPE_Self,
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MissileAlive",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "FlashMissileId",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      TargetType = TTYPE_Location,
      TargetVar = "Owner"
    }
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
      Src1Var = "MissileAlive",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "FlashMissileId",
          MissileIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBGetMissilePosFromID,
        Params = {
          TargetIDVar = "FlashMissileId",
          TargetIDVarTable = "InstanceVars",
          TargetID = 0,
          ResultVar = "MissileEndPosition"
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Attacker", DestVar = "TeamID"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamID",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissileEndPosition",
              EffectName = "cryo_FlashFrost_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 100,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "MissileEndPosition",
              EffectName = "cryo_FlashFrost_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 100,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "MissileEndPosition",
          Range = 210,
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
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              DamageByLevel = {
                60,
                90,
                120,
                150,
                180
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.5,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBApplyStun,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Duration = 0.75
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MovementSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValue = -0.2
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "Chilled",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
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
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MissileAlive",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CooldownPerLevel",
      SrcValue = 0,
      SrcValueByLevel = {
        12,
        11,
        10,
        9,
        8
      }
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
      Src2Var = "CooldownPerLevel",
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
  }
}
BuffOnMissileEndBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "FlashFrostSpell",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {
          TargetVar = "Owner",
          DestVar = "TeamOfOwner"
        }
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "MissileEndPosition",
          EffectName = "cryo_FlashFrost_tar.troy",
          Flags = 0,
          EffectIDVar = "arr",
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
          CenterVar = "MissileEndPosition",
          Range = 230,
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
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              DamageByLevel = {
                60,
                90,
                120,
                150,
                180
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.5,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBApplyStun,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Duration = 0.75
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MovementSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValue = -0.2
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
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "Chilled",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
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
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MissileAlive",
          DestVarTable = "InstanceVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FlashFrost"
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "FlashFrost"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "FlashFrost"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "Level", Info = GetCastSpellLevelPlusOne}
      },
      {
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "TargetPos"}
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0.285,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 0,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Nothing",
          PosVar = "TargetPos",
          EndPosVar = "TargetPos",
          OverrideCastPosition = false,
          SlotNumber = 0,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      }
    }
  }
}
BuffOnLaunchMissileBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "FlashMissileId",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "FlashMissileId",
          DestVarTable = "InstanceVars",
          SrcVar = "missileId"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MissileAlive",
          DestVarTable = "InstanceVars",
          SrcValue = 1
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cryo_flashfrost_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "chilled"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "flashfrost"}
  }
}
