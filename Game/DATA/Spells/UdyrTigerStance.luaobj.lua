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
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
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
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Run",
      OverrideAnim = "Run2",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle1",
      OverrideAnim = "Idle2",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle3",
      OverrideAnim = "Idle2",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle4",
      OverrideAnim = "Idle2",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle5",
      OverrideAnim = "Idle2",
      OwnerVar = "Owner"
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
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = true}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle1", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle3", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle4", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle5", OwnerVar = "Owner"}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
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
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        0.24,
        0.33,
        0.42,
        0.51,
        0.6
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatCritChanceMod,
      TargetVar = "Owner",
      DestVar = "CritMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CritMod",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "CritMod",
      MathOp = MO_MULTIPLY
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
      Src1Value = 2.5,
      Src2Value = 0,
      DestVar = "CooldownPerc",
      MathOp = MO_MULTIPLY
    }
  },
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
  },
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
  },
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
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UdyrTigerPunch",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 6,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
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
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tigerpelt.troy"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "udyrtigerpunch"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "tigerstance.troy"
    }
  }
}
