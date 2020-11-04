NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "XinZhao_BattleCry.dds"
BuffName = "XenZhaoBattleCry"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CDTimer",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "XenZhaoBattleCryPH",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "CDTimer",
      TickRate = 0,
      CanMitigateDuration = false
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
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SelfASMod",
      RequiredVarTable = "InstanceVars"
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
      EffectName = "xen_ziou_battleCry_cas_05.troy",
      Flags = 0,
      EffectIDVar = "BattleCryPH",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "xen_ziou_battleCry_cas_03.troy",
      Flags = 0,
      EffectIDVar = "BattleCryPH",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM__WEAPON_1",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "xen_ziou_battleCry_cas_02.troy",
      Flags = 0,
      EffectIDVar = "BattleCryPH",
      EffectIDVarTable = "InstanceVars",
      BoneName = "R_hand",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "xenZhiou_battleCry_active.troy",
      Flags = 0,
      EffectIDVar = "BattleCryPH",
      EffectIDVarTable = "InstanceVars",
      BoneName = "R_hand",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "xenZhiou_battleCry_active.troy",
      Flags = 0,
      EffectIDVar = "BattleCryPH",
      EffectIDVarTable = "InstanceVars",
      BoneName = "L_hand",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "xenZiou_battle_cry_weapon_01.troy",
      Flags = 0,
      EffectIDVar = "BattleCries",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_CSTM__WEAPON_1",
      TargetObjectVar = "Owner",
      TargetBoneName = "BUFFBONE__CSTM___WEAPON_4",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "BattleCries",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "SelfASMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CD0",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CD0",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "Slot0CD",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Slot0CD",
      SlotNumber = 0,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CD2",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CD2",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "Slot2CD",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Slot2CD",
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "CD3",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CD3",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "Slot3CD",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "Slot3CD",
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "XenZhaoBattleCryPassive"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SelfASMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.3,
        0.4,
        0.5,
        0.6,
        0.7
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
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaobattlecryph"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xen_ziou_battlecry_cas_05.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xen_ziou_battlecry_cas_03.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xen_ziou_battlecry_cas_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenzhiou_battlecry_active.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_battle_cry_weapon_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaobattlecrypassive"
    }
  }
}
