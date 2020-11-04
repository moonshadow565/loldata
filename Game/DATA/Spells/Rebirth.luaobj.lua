NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Cryophoenix_Rebirth.dds"
BuffName = "Rebirth"
NonDispellable = true
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "RebirthArmorMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CurrentCooldown",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CurrentCooldown2",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentCooldown",
      Value2 = 6,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 6,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          SpellSlotValue = 0,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentCooldown2",
      Value2 = 6,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 6,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          SpellSlotValue = 1,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBPushCharacterData,
    Params = {
      SkinName = "RebirthEgg",
      TargetVar = "Owner",
      IDVar = "SeaHorseID",
      IDVarTable = "InstanceVars",
      OverrideSpells = false
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 10000,
      HealerVar = "Owner"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "EggTimer.troy",
      Flags = 0,
      EffectIDVar = "EggTimer",
      EffectIDVarTable = "InstanceVars",
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
      Status = SetCanCast
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
    Params = {TargetVar = "Owner", Type = BUFF_Sleep}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RebirthCooldown",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 240,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
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
      Status = SetCanCast
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
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Rebirth_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle",
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
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "EggTimer",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBPopAllCharacterData,
    Params = {TargetVar = "Owner"}
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
      Status = SetCanCast
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
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "RebirthArmorMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "RebirthArmorMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "rebirthegg"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eggtimer.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rebirthcooldown"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rebirth_cas.troy"
    }
  }
}
