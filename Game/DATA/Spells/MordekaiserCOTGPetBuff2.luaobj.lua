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
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Blind}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Poison}
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Suppression}
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
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 30,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "MordekaiserCOTGPetBuff",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 30,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
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
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KogMawIcathianSurprise"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KogMawIcathianSurprise"
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "KogMawIcathianSurpriseReady"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KogMawIcathianSurpriseReady"
        }
      }
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
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageToDeal",
      DestVarTable = "NextBuffVars",
      SrcVar = "DamageAmount"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Caster",
      AttackerVar = "Target",
      BuffName = "MordekaiserCOTGPetDmg",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.001,
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
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgpetbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawicathiansurprise"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawicathiansurpriseready"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercotgpetdmg"
    }
  }
}
