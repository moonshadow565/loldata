NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "SummonerGarrison.dds"
BuffName = "Fortify"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_ally_capture_buf_01.troy",
      Flags = 0,
      EffectIDVar = "AuraParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
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
      EffectName = "Summoner_ally_capture_buf_02.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
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
      EffectName = "Summoner_capture_Pulse.troy",
      Flags = 0,
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
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
      SrcValue = true,
      Status = SetPhysicalImmune
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetMagicImmune
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Splash",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Attacker",
      SourceVar = "Owner"
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1200,
      Flags = "AffectEnemies AffectNeutral AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Unit",
          BuffName = "OdinCaptureChannel"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "Ezreal_essenceflux_tar.troy",
          Flags = 0,
          EffectIDVar = "asdf",
          BoneName = "root",
          TargetObjectVar = "Unit",
          SpecificUnitOnlyVar = "Unit",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "AuraParticle",
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetPhysicalImmune
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetMagicImmune
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamOfOwner",
      Value2 = TEAM_NEUTRAL,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "SummonerOdinGarrison"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = true,
          Status = SetPhysicalImmune
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = true,
          Status = SetMagicImmune
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatPhysicalDamageMod,
          TargetVar = "Owner",
          Delta = 0
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentCooldownMod,
          TargetVar = "Owner",
          Delta = -1
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 800,
          PARType = PAR_MANA
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Splash",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0.5,
          DestVar = "newDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Target",
          Range = 250,
          Flags = "AffectEnemies AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Target",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "newDamage",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_PROC,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 1,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          }
        }
      }
    }
  }
}
CanCastBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
      TrackTimeVar = "LastTimeExecutedGarrison",
      TrackTimeVarTable = "AvatarVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CanCastGarrison",
          DestVarTable = "AvatarVars",
          SrcValue = false
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1250,
          Flags = "AffectEnemies AffectFriends AffectMinions NotAffectSelf AffectUseable AffectWards ",
          IteratorVar = "Unit",
          BuffNameFilter = "OdinGuardianBuff",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CanCastGarrison",
              DestVarTable = "AvatarVars",
              SrcValue = true
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "CanCastGarrison",
      SrcVarTable = "AvatarVars"
    }
  }
}
SpellUpdateTooltipBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 210
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "CooldownMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BaseCooldown",
      Index = 1,
      SlotNumber = 0,
      SlotNumberVar = "SpellSlot",
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_SUMMONER,
      TargetVar = "Attacker"
    }
  }
}
AdjustCooldownBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownMultiplier",
          Src1Value = 210,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "BaseCooldown"
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "summoner_cast.troy",
      Flags = 0,
      EffectIDVar = "ar",
      TargetObjectVar = "Target",
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
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1800,
      Flags = "AffectEnemies AffectFriends AffectMinions AffectTurrets AffectUseable AffectWards ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      BuffNameFilter = "OdinGuardianBuff",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "defensiveMastery",
          Src1VarTable = "AvatarVars",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Splash",
              DestVarTable = "NextBuffVars",
              SrcValue = true
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Splash",
              DestVarTable = "NextBuffVars",
              SrcValue = false
            }
          }
        }
      },
      {
        Function = BBGetTeamID,
        Params = {
          TargetVar = "Owner",
          DestVar = "TeamOfOwner"
        }
      },
      {
        Function = BBGetTeamID,
        Params = {
          TargetVar = "Unit",
          DestVar = "TeamOfTarget"
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Unit",
          BuffName = "OdinGuardianBuff"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "TeamOfOwner",
              Src2Var = "TeamOfTarget",
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Invulnerability,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 8,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "SummonerOdinGarrisonDebuff",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Invulnerability,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 8,
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
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "SlotName",
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
              Src1Var = "SlotName",
              Value2 = "SummonerOdinGarrison",
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetSlotSpellCooldownTime,
                Params = {
                  SrcValue = 1,
                  SpellbookType = SPELLBOOK_SUMMONER,
                  SlotType = SpellSlots,
                  SpellSlotValue = 0,
                  OwnerVar = "Owner"
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSetSlotSpellCooldownTime,
                Params = {
                  SrcValue = 1,
                  SpellbookType = SPELLBOOK_SUMMONER,
                  SlotType = SpellSlots,
                  SpellSlotValue = 1,
                  OwnerVar = "Owner"
                }
              }
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
      Name = "summoner_ally_capture_buf_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_ally_capture_buf_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_capture_pulse.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "ezreal_essenceflux_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerodingarrisondebuff"
    }
  }
}
