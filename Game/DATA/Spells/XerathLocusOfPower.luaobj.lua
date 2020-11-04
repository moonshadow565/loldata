NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Xerath_LocusOfPower.dds"
BuffName = "XerathLocusOfPower"
SpellToggleSlot = 2
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MagicPen",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMagicPenetrationMod,
      TargetVar = "Owner",
      DeltaVar = "MagicPen",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "XerathLocusOfPowerToggle",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0.5,
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "XerathArcanopulseExtended",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Cooldown",
      SlotNumber = 0,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown2",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "XerathMageChainsExtended",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Cooldown2",
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown3",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "XerathArcaneBarrageWrapperExt",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Cooldown3",
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Xerath_LocusOfPower_buf.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamOfOwner",
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Xerath_LocusOfPower_beam.troy",
      Flags = 0,
      EffectIDVar = "Particlea",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_GLB_CHANNEL_LOC",
      TargetObjectVar = "Owner",
      TargetBoneName = "spine",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Xerath_LocusOfPower_beam.troy",
      Flags = 0,
      EffectIDVar = "Particleb",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_CHANNEL_2",
      TargetObjectVar = "Owner",
      TargetBoneName = "spine",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Xerath_LocusOfPower_beam.troy",
      Flags = 0,
      EffectIDVar = "Particlec",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_CHANNEL_3",
      TargetObjectVar = "Owner",
      TargetBoneName = "spine",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
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
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle1",
      OverrideAnim = "Spell2_chan",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle2",
      OverrideAnim = "Spell2_chan",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle3",
      OverrideAnim = "Spell2_chan",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Idle4",
      OverrideAnim = "Spell2_chan",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "FlashCheck",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FlashCheck",
      Value2 = "SummonerFlash",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "FlashCheck",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FlashCheck",
      Value2 = "SummonerFlash",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = true
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "XerathLocusOfPower",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Cooldown",
      SrcValueByLevel = {
        20,
        16,
        12,
        8,
        4
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
      Src1Var = "Cooldown",
      Src2Var = "Multiplier",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "NewCooldown",
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
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
      EffectIDVar = "Particlea",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particleb",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particlec",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 0,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "XerathArcanopulse",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Cooldown",
      SlotNumber = 0,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown2",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "XerathMageChains",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Cooldown2",
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Cooldown",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "XerathArcaneBarrageWrapper",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Cooldown",
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle1", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Idle2", OwnerVar = "Owner"}
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
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "FlashCheck",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FlashCheck",
      Value2 = "SummonerFlash",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 0,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "FlashCheck",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_SUMMONER,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellName
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FlashCheck",
      Value2 = "SummonerFlash",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 1,
          SpellbookType = SPELLBOOK_SUMMONER,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "XerathEnergize",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
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
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMagicPenetrationMod,
      TargetVar = "Owner",
      DeltaVar = "MagicPen",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathlocusofpowertoggle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanopulseextended"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathmagechainsextended"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanebarragewrapperext"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_locusofpower_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_locusofpower_beam.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathlocusofpower"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanopulse"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathmagechains"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xeratharcanebarragewrapper"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xerathenergize"
    }
  }
}
