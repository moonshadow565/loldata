NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Udyr_TigerStance.dds"
BuffName = "UdyrTigerStance"
SpellToggleSlot = 1
PersistsThroughDeath = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBPushCharacterData,
    Params = {
      SkinName = "UdyrTiger",
      TargetVar = "Owner",
      IDVar = "CasterID",
      IDVarTable = "InstanceVars",
      OverrideSpells = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "tigerpelt.troy",
      Flags = 0,
      EffectIDVar = "tiger",
      EffectIDVarTable = "InstanceVars",
      BoneName = "head",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false
    }
  },
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 1,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1,
      CancelAttack = true
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "passiveAttackSpeed",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "tiger",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "UdyrTigerPunch"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UdyrTigerShred"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "passiveAttackSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "hitOnce",
      Src1VarTable = "CharVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "hitOnce",
          DestVarTable = "CharVars",
          SrcValue = false
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "baseDamage",
          SrcValueByLevel = {
            40,
            90,
            140,
            190,
            240
          }
        }
      },
      {
        Function = BBGetTotalAttackDamage,
        Params = {TargetVar = "Owner", DestVar = "TAD"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TAD",
          Src1Value = 0,
          Src2Value = 1.7,
          DestVar = "DotDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DotDamage",
          Src2Var = "baseDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DotDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DotDamage",
          Src1Value = 0,
          Src2Value = 0.25,
          DestVar = "DotDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DotDamage",
          DestVarTable = "NextBuffVars",
          SrcVar = "DotDamage"
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffName = "UdyrTigerPunchBleed",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Damage,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {EffectIDVar = "lhand", EffectIDVarTable = "CharVars"}
      },
      {
        Function = BBSpellEffectRemove,
        Params = {EffectIDVar = "rhand", EffectIDVarTable = "CharVars"}
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
      BuffName = "UdyrBearStance"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UdyrBearStance"
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UdyrPhoenixStance"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UdyrPhoenixStance"
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UdyrTurtleStance"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UdyrTurtleStance"
        }
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownPerc"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownPerc",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "CooldownPerc",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownPerc",
      Src1Value = 1.5,
      Src2Value = 0,
      DestVar = "CooldownPerc",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CurrentCD",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentCD",
      Src2Var = "CooldownPerc",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcVar = "CooldownPerc",
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 1,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CurrentCD",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentCD",
      Src2Var = "CooldownPerc",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcVar = "CooldownPerc",
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 2,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CurrentCD",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentCD",
      Src2Var = "CooldownPerc",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcVar = "CooldownPerc",
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 3,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "activeAttackSpeed",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.15,
        0.2,
        0.25,
        0.3,
        0.35
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "passiveAttackSpeed",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.2,
        0.25,
        0.3,
        0.35,
        0.4
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UdyrTigerPunch",
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "TigerStance.troy",
      Flags = 0,
      EffectIDVar = "Tigerparticle",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UdyrTigerShred",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
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
          DestVar = "passiveAttackSpeed",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            0.15,
            0.2,
            0.25,
            0.3,
            0.35
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "udyrtiger"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tigerpelt.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerpunch"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerpunchbleed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrbearstance"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrphoenixstance"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrturtlestance"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tigerstance.troy"
    }
  }
}
