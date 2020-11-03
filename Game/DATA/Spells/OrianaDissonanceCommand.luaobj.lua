NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
SelfExecuteBuildingBlocks = {
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell2",
      ScaleTime = 0,
      TargetVar = "Owner",
      Loop = false,
      Blend = true,
      Lock = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OrianaGlobalCooldown",
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
      Duration = 0.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      SrcValueByLevel = {
        70,
        120,
        170,
        220,
        270
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Deployed", SrcValue = false}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "SelfAP"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SelfAP",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Damage",
      Src2Var = "BonusDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "Damage",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectMinions AffectHeroes NotAffectSelf AffectUntargetable ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      BuffNameFilter = "OrianaGhost",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "Deployed", SrcValue = true}
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Unit", PositionVar = "TargetPos"}
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "TeamID",
              Value2 = TEAM_ORDER,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaDissonance_ally_green.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_ORDER,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_ORDER,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaDissonance_ally_red.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_ORDER,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "TeamID",
              Value2 = TEAM_CHAOS,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaDissonance_ally_green.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_CHAOS,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaDissonance_ally_red.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_ORDER,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_CHAOS,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
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
            Function = BBIf,
            Params = {
              Src1Var = "TeamID",
              Value2 = TEAM_ORDER,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaDissonance_ball_green.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_ORDER,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_ORDER,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaDissonance_ball_red.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_ORDER,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "TeamID",
              Value2 = TEAM_CHAOS,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaDissonance_ball_green.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_CHAOS,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "TargetPos",
                  EffectName = "OrianaDissonance_ball_red.troy",
                  Flags = 0,
                  EffectIDVar = "Particle",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Nothing",
                  TargetPosVar = "TargetPos",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_ORDER,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_CHAOS,
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Deployed",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "TargetPos"}
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Nothing",
          BuffName = "OriannaBallTracker"
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TargetPos",
              SrcVar = "BallPosition",
              SrcVarTable = "CharVars"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamID",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "TargetPos",
              EffectName = "OrianaDissonance_cas_green.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Nothing",
              TargetPosVar = "TargetPos",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "TargetPos",
              EffectName = "OrianaDissonance_cas_red.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Nothing",
              TargetPosVar = "TargetPos",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamID",
          Value2 = TEAM_CHAOS,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "TargetPos",
              EffectName = "OrianaDissonance_cas_green.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Nothing",
              TargetPosVar = "TargetPos",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "TargetPos",
              EffectName = "OrianaDissonance_cas_red.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Nothing",
              TargetPosVar = "TargetPos",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "TargetPos",
      Range = 225,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "OrianaDissonance_tar.troy",
          Flags = 0,
          EffectIDVar = "Temp",
          TargetObjectVar = "Unit",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Owner",
          CallForHelpAttackerVar = "Owner",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "Damage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          DestVarTable = "NextBuffVars",
          SpellSlotValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "OrianaSlow",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Slow,
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
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "TargetPos",
      Range = 225,
      Flags = "AffectFriends AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          DestVarTable = "NextBuffVars",
          SpellSlotValue = 1,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "OrianaHaste",
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
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "targetPos",
      DestVarTable = "NextBuffVars",
      SrcVar = "TargetPos"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OrianaDissonanceWave",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaglobalcooldown"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghost"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianadissonance_ally_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianadissonance_ally_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianadissonance_ball_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianadissonance_ball_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "oriannaballtracker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianadissonance_cas_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianadissonance_cas_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianadissonance_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "orianaslow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianahaste"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianadissonancewave"
    }
  }
}
