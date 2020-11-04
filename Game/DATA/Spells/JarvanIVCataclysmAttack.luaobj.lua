NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
CastTime = 0.4
OnBuffActivateBuildingBlocks = {
  {
    Function = BBShowHealthBar,
    Params = {UnitVar = "Owner", Show = false}
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
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
      Status = SetCanMove
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
      Status = SetCallForHelpSuppresser
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetForceRenderParticles
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetNoRender
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
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 100,
      Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetStatus,
        Params = {
          TargetVar = "Unit",
          DestVar = "ghosted",
          Status = GetGhosted
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "PushDistance",
              SrcValue = 110
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
              DestVar = "PushDistance",
              SrcValue = 125
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Unit",
          CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
        },
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 0,
              DistanceVar = "PushDistance",
              OffsetAngle = 0,
              PositionVar = "TargetPos"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 0,
              DistanceVar = "PushDistance",
              OffsetAngle = 180,
              PositionVar = "TargetPos"
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TargetPos",
          DestVarTable = "NextBuffVars",
          SrcVar = "TargetPos"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "ghosted",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "CrystallizePush",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Stun,
              MaxStack = 76,
              NumberOfStacks = 1,
              Duration = 0.25,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = true
            }
          }
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 0,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "OwnerPos",
      EffectName = "JarvanWallCrumble.troy",
      Flags = 0,
      EffectIDVar = "asdf",
      BoneName = "root",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "JarvanIVCataclysmSelfCheck"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "JarvanIVCataclysmSelfCheck"
        }
      }
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
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 10000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      PhysicalDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Attacker",
          Range = 600,
          Flags = "AffectFriends AffectHeroes ",
          IteratorVar = "Attacker",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "JarvanIVCataclysmSelfCheck"
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "JarvanIVCataclysmAttack"
                }
              }
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
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "TargetPos"}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "teamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "JarvanCataclysm_tar.troy",
      Flags = 0,
      EffectIDVar = "groundhit",
      BoneName = "weapon_C",
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
    Function = BBForEachPointAroundCircle,
    Params = {
      CenterVar = "TargetPos",
      Radius = 350,
      Iterations = 12,
      IteratorVar = "Pos"
    },
    SubBlocks = {
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "JarvanIVWall",
          Skin = "JarvanIVWall",
          AiScript = "idle.lua",
          PosVar = "Pos",
          Team = TEAM_UNKNOWN,
          TeamVar = "teamID",
          Stunned = true,
          Rooted = true,
          Silenced = true,
          Invulnerable = true,
          MagicImmune = true,
          IgnoreCollision = true,
          Placemarker = false,
          VisibilitySize = 0,
          DestVar = "Other2",
          GoldRedirectTargetVar = "Attacker"
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Other2", LocationVar = "TargetPos"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TargetPos",
          DestVarTable = "NextBuffVars",
          SrcVar = "TargetPos"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other2",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSetStatus,
        Params = {
          TargetVar = "Other2",
          SrcValue = true,
          Status = SetGhostProof
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 1200,
      Flags = "AffectEnemies AffectFriends AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBForceRefreshPath,
        Params = {UnitVar = "Unit"}
      }
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Target"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        200,
        350,
        500
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "PhysPreMod"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "PhysPreMod",
      Src1Value = 1.5,
      Src2Value = 0,
      DestVar = "PhysPostMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "PhysPostMod",
      Src2Var = "BaseDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageToDeal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "DamageToDeal",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELL,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = true,
      IgnoreDamageCrit = true
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "JarvanIVCataclysmCheck",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UnstoppableForceMarker"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "crystallizepush"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvanwallcrumble.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysmselfcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysmattack"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jarvancataclysm_tar.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "jarvanivwall"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jarvanivcataclysmcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcemarker"
    }
  }
}
