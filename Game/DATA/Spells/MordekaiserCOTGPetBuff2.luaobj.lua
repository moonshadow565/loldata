BuffTextureName = "Mordekaiser_COTG.dds"
BuffName = "MordekaiserCOTGPet"
IsPetDurationBuff = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
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
          BindObjectVar = "Owner",
          EffectName = "mordekaiser_cotg_ring.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "mordekaiser_cotg_ring.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
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
          BindObjectVar = "Owner",
          EffectName = "mordekaiser_cotg_ring.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "mordekaiser_cotg_ring.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_CombatEnchancer}
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
    Params = {TargetVar = "Owner", Type = BUFF_Silence}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Taunt}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Polymorph}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Slow}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Snare}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Damage}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Heal}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Haste}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_SpellImmunity}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_PhysicalImmunity}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Invulnerability}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Sleep}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Fear}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Net}
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Owner", DestVar = "PetDamage"}
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PetDamage",
      Src1Value = 0.25,
      Src2Value = 0,
      DestVar = "PetDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "PetAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PetAP",
      Src1Value = 0.25,
      Src2Value = 0,
      DestVar = "PetAP",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PetDamage",
      DestVarTable = "NextBuffVars",
      SrcVar = "PetDamage"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PetAP",
      DestVarTable = "NextBuffVars",
      SrcVar = "PetAP"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "MordekaiserCOTGSelf",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 30,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "MordAP"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "StatMultiplier",
      SrcValueByLevel = {
        0.65,
        0.75,
        0.85
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MordAP",
      Src1Value = 0,
      Src2Value = 0.001,
      DestVar = "StatAPCoeff",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StatAPCoeff",
      Src2Var = "StatMultiplier",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "StatMultiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetTotalAttackDamage,
    Params = {TargetVar = "Attacker", DestVar = "MordDamage"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StatMultiplier",
      Src2Var = "MordDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MordDamage",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StatMultiplier",
      Src2Var = "MordAP",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MordAP",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "MordDamage",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "MordAP",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MordHealth",
      OwnerVar = "Attacker",
      Function = GetMaxHealth,
      PARType = PAR_SHIELD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StatMultiplier",
      Src2Var = "MordHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MordHealth",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatHPPoolMod,
      TargetVar = "Owner",
      DeltaVar = "MordHealth",
      Delta = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "MordDamage",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "MordDamage",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "MordAP",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "MordAP",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "MordAP",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "MordDamage",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Owner",
      Damage = 10000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "MordekaiserCOTGSelf"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "MordekaiserCOTGSelf"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMovementSpeedMod,
      TargetVar = "Caster",
      DestVar = "CasMovespeedMod"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMovementSpeedMod,
      TargetVar = "Owner",
      DestVar = "OwnMovespeedMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CasMovespeedMod",
      Src2Var = "OwnMovespeedMod",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MovespeedDiff",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MovespeedDiff",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordekeiser_cotg_skin.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordekaiser_cotg_ring.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgself"
    }
  }
}
