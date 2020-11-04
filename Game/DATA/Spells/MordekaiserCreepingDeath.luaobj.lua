BuffTextureName = "MordekaiserCreepingDeath.dds"
BuffName = "MordekaiserCreepingDeathBuff"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerTick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DefenseStats",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseStats",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseStats",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSkinID,
        Params = {
          UnitVar = "Attacker",
          SkinIDVar = "MordekaiserSkinID"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MordekaiserSkinID",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "mordekaiser_creepingDeath_auraGold.troy",
              Flags = 0,
              EffectIDVar = "b",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "MordekaiserSkinID",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "mordekaiser_creepingDeath_auraRed.troy",
              Flags = 0,
              EffectIDVar = "b",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
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
              EffectName = "mordekaiser_creepingDeath_aura.troy",
              Flags = 0,
              EffectIDVar = "b",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          }
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
          EffectName = "mordekaiser_creepingDeath_tar.troy",
          Flags = 0,
          EffectIDVar = "b",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "MordekaiserCreepingDeathCheck"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "MordekaiserCreepingDeathCheck"
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DefenseStats",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "DefenseStats",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseStats",
      Delta = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "DefenseStats",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars"
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
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Owner",
          Range = 350,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamagePerTick",
              DestVarTable = "NextBuffVars",
              SrcVar = "DamagePerTick",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Unit",
              BuffName = "MordekaiserCreepingDeathDebuff",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 100,
              NumberOfStacks = 1,
              Duration = 0.001,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
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
      DestVar = "DamagePerTick",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        24,
        38,
        52,
        66,
        80
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DefenseStats",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        10,
        15,
        20,
        25,
        30
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Owner",
      BuffName = "MordekaiserCreepingDeathCheck"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Owner",
          CompareOp = CO_SAME_TEAM
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 6,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Owner",
          CompareOp = CO_DIFFERENT_TEAM
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Target",
              BuffName = "MordekaiserCreepingDeathDebuff",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 100,
              NumberOfStacks = 1,
              Duration = 0.001,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
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
      Name = "mordekaiser_creepingdeath_auragold.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordekaiser_creepingdeath_aurared.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordekaiser_creepingdeath_aura.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "mordekaiser_creepingdeath_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercreepingdeathcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "mordekaisercreepingdeathdebuff"
    }
  }
}
