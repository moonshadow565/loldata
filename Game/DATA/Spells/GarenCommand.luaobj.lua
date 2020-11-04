NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_CommandingPresence.dds"
BuffName = "GarenCommand"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
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
      RequiredVar = "DamageReduction",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMagicReduction,
      TargetVar = "Owner",
      DeltaVar = "DamageReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "garen_commandingPresence_unit_buf_self.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_GLB_SHIELD",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TotalArmorAmount",
      ValueVarTable = "InstanceVars",
      Index = 1
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentPhysicalReduction,
      TargetVar = "Owner",
      DeltaVar = "DamageReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentPhysicalReduction,
      TargetVar = "Owner",
      DeltaVar = "DamageReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMagicReduction,
      TargetVar = "Owner",
      DeltaVar = "DamageReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Attacker",
      DestVar = "AbilityPower"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorAmount",
      SrcValueByLevel = {
        65,
        100,
        135,
        170,
        205
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageReduction",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.1,
        0.15,
        0.2,
        0.25,
        0.3
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BuffDuration",
      SrcValueByLevel = {
        3,
        3,
        3,
        3,
        3
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "AbilityPower",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AbilityPower",
      Src2Var = "ArmorAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalArmorAmount",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TotalArmorAmount",
      DestVarTable = "NextBuffVars",
      SrcVar = "TotalArmorAmount"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Attacker",
      EffectName = "garen_command_cas.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_GLB_SHIELD",
      TargetObjectVar = "Attacker",
      SpecificUnitOnlyVar = "Attacker",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "BuffDuration",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_commandingpresence_unit_buf_self.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_command_cas.troy"
    }
  }
}
