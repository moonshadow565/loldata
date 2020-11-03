NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Sona_SongofDiscordGold.dds"
BuffName = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
SpellFXOverrideSkins = {"GuqinSona"}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaHymnOfValor",
      ResetDuration = 0
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaAriaOfPerseverance",
      ResetDuration = 0
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "SonaPowerChord"
    },
    SubBlocks = {
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 5,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 1,
          CancelAttack = false
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaSongofDiscord",
      BuffAddType = BUFF_REPLACE_EXISTING,
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
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaPowerChord"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "SonaSongofDiscordCheck",
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
      Src1Value = 2,
      Src2Value = 0,
      DestVar = "CooldownPerc",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CurrentCD",
      SpellSlotValue = 0,
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
          SpellSlotValue = 0,
          OwnerVar = "Owner"
        }
      }
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.08,
        0.1,
        0.12,
        0.14,
        0.16
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1000,
      Flags = "AffectFriends AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Unit",
          PosVar = "Owner",
          EndPosVar = "Owner",
          OverrideCastPosition = false,
          SlotNumber = 6,
          SlotType = ExtraSlots,
          OverrideForceLevel = 0,
          OverrideForceLevelVar = "Level",
          OverrideCoolDownCheck = true,
          FireWithoutCasting = true,
          UseAutoAttackSpell = false,
          ForceCastingOrChannelling = false,
          UpdateAutoAttackTimer = false
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1000,
      Flags = "AffectFriends AffectMinions ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBApplyAssistMarker,
        Params = {
          Duration = 10,
          TargetVar = "Unit",
          SourceVar = "Attacker"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "SonaSongofDiscordHaste",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Haste,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaSongofDiscordAura",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2.5,
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
      BuffName = "UnlockAnimation",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.25,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell3",
      ScaleTime = 1,
      TargetVar = "Owner",
      Loop = false,
      Blend = true,
      Lock = true
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscord"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscordcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscordhaste"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscordaura"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  }
}
