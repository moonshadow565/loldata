NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
ChannelDuration = 1.25
BuffTextureName = "Caitlyn_AceintheHole.dds"
BuffName = "CaitlynAceintheHole"
AutoBuffActivateEffect = "caitlyn_ace_target_indicator.troy"
AutoBuffActivateEffect2 = "caitlyn_ace_target_indicator_02.troy"
AutoBuffActivateAttachBoneName2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "Team"}
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "Team",
      Radius = 50,
      TargetVar = "Owner",
      Duration = 4,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = true,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BubbleID",
      DestVarTable = "NextBuffVars",
      SrcVar = "BubbleID",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "CaitlynAceintheHoleVisibility",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Attacker",
      State = false
    }
  }
}
ChannelingStartBuildingBlocks = {
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Target"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "CaitlynAceintheHole",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "caitlyn_laser_beam_01.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM_WEAPON_5",
      TargetObjectVar = "Target",
      TargetBoneName = "spine",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Target",
      DestVar = "IsStealthed",
      Status = GetStealthed
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Target"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "Team"}
  },
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Target",
      PosVar = "Target",
      EndPosVar = "Target",
      OverrideCastPosition = false,
      SlotNumber = 0,
      SlotType = ExtraSlots,
      OverrideForceLevel = 0,
      OverrideForceLevelVar = "Level",
      OverrideCoolDownCheck = true,
      FireWithoutCasting = true,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "IfHasBuffCheck",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 5,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 3,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "CaitlynAceintheHole"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "caitlynaceintheholevisibility"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "caitlynaceinthehole"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "caitlyn_laser_beam_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  }
}
