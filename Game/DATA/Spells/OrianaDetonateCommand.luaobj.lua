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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      SrcValueByLevel = {
        150,
        250,
        350
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Deployed", SrcValue = false}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.4,
        -0.5,
        -0.6
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RangeVar",
      SrcValueByLevel = {
        415,
        415,
        415,
        415,
        415
      }
    }
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
      Src2Value = 0.7,
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CurrentType",
              SrcValue = 0
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
              DestVar = "CurrentType",
              SrcValue = 1
            }
          }
        }
      },
      {
        Function = BBSetUnit,
        Params = {SrcVar = "Unit", DestVar = "Other1"}
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
        Function = BBIf,
        Params = {
          Src1Var = "GhostAlive",
          Src1VarTable = "CharVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetMissilePosFromID,
            Params = {
              TargetIDVar = "MissileID",
              TargetIDVarTable = "CharVars",
              TargetID = 0,
              ResultVar = "TargetPos"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CurrentType",
              SrcValue = 2
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Owner", PositionVar = "TargetPos"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CurrentType",
              SrcValue = 3
            }
          },
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 0,
              OffsetAngle = 0,
              PositionVar = "TargetPos"
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentType",
      Src2Var = "UltimateType",
      Src2VarTable = "CharVars",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CurrentType",
          SrcValue = 5
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TargetPos",
          SrcVar = "UltimateTargetPos",
          SrcVarTable = "CharVars"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurrentType",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Other1",
          PosVar = "TargetPos",
          EffectName = "Oriana_Shockwave_nova_ally.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "SpinnigTopRidge",
          TargetObjectVar = "Nothing",
          TargetPosVar = "TargetPos",
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
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "CurrentType",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Other1",
          PosVar = "TargetPos",
          EffectName = "Oriana_Shockwave_nova.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "SpinnigTopRidge",
          TargetObjectVar = "Nothing",
          TargetPosVar = "TargetPos",
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
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "CurrentType",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          PosVar = "TargetPos",
          EffectName = "Oriana_Shockwave_nova.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "SpinnigTopRidge",
          TargetObjectVar = "Nothing",
          TargetPosVar = "TargetPos",
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
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "CurrentType",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "TargetPos",
          EffectName = "Oriana_Shockwave_nova.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          BoneName = "SpinnigTopRidge",
          TargetObjectVar = "Nothing",
          TargetPosVar = "TargetPos",
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
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "CurrentType",
      Value2 = 5,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "TargetPos",
          EffectName = "Oriana_Shockwave_nova.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Nothing",
          TargetPosVar = "TargetPos",
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
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "TargetPos",
      Range = 0,
      RangeVar = "RangeVar",
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "CanSee"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ValidTarget",
          SrcValue = true
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_HERO},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "CanSee",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "ValidTarget",
                  SrcValue = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "ValidTarget",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Unit",
              Distance = 425,
              OffsetAngle = 0,
              PositionVar = "OldPos"
            }
          },
          {
            Function = BBFaceDirection,
            Params = {TargetVar = "Unit", LocationVar = "TargetPos"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "OrianaDetonate_tar.troy",
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
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Unit",
              Distance = 425,
              OffsetAngle = -180,
              PositionVar = "NewPos"
            }
          },
          {
            Function = BBFaceDirection,
            Params = {TargetVar = "Unit", LocationVar = "OldPos"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Distance",
              DestVarTable = "NextBuffVars",
              SrcValue = 790
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "IdealDistance",
              DestVarTable = "NextBuffVars",
              SrcValue = 870
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Gravity",
              DestVarTable = "NextBuffVars",
              SrcValue = 25
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Speed",
              DestVarTable = "NextBuffVars",
              SrcValue = 775
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Center",
              DestVarTable = "NextBuffVars",
              SrcVar = "NewPos"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "OrianaStun",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.75,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "MoveAwayCollision",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.75,
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
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaglobalcooldown"
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
      Name = "oriana_shockwave_nova_ally.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "oriana_shockwave_nova.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianadetonate_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "orianastun"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "moveawaycollision"
    }
  }
}
