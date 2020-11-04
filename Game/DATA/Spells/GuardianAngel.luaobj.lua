BuffTextureName = "Cryophoenix_Rebirth.dds"
AutoBuffActivateEffect = "LifeAura.troy"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "LifeAura.troy",
      Flags = 0,
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
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Death",
      ScaleTime = 4,
      TargetVar = "Owner",
      Loop = false
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = -10000,
      PARType = PAR_MANA
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSuppressCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCallForHelpSuppresser
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetIgnoreCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetInvulnerable
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
      Value2 = 4,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 4,
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
      Value2 = 4,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 4,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          SpellSlotValue = 1,
          OwnerVar = "Owner"
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "TempHealth",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "TempMaxHealth",
      OwnerVar = "Owner",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TempMaxHealth",
      Src1Value = 0.4,
      Src2Value = 0,
      DestVar = "HealthNeeded",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "HealthNeeded",
      Src2Var = "TempHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "HealthToInc",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "HealthToInc",
      HealerVar = "Owner"
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "TempMana",
      OwnerVar = "Owner",
      Function = GetPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "TempMaxMana",
      OwnerVar = "Owner",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "TempMaxMana",
      Src1Value = 0.4,
      Src2Value = 0,
      DestVar = "ManaNeeded",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "ManaNeeded",
      Src2Var = "TempMana",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "ManaToInc",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_MANA,
      DeltaVar = "ManaToInc"
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetSuppressCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCallForHelpSuppresser
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetIgnoreCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetTargetable
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner"}
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "idle1",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = false
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "GuardianAngel_tar.troy",
      Flags = 0,
      EffectIDVar = "Part",
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
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "WillRevive"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "HasBeenRevived",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 300,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
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
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSuppressCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCallForHelpSuppresser
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetIgnoreCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetInvulnerable
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
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      Delta = -100
    }
  },
  {
    Function = BBIncFlatPARRegenMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      Delta = -100
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lifeaura.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "guardianangel_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "willrevive"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hasbeenrevived"
    }
  }
}
