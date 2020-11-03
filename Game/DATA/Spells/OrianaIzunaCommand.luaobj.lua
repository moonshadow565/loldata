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
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OrianaGhostSelf"
    }
  },
  {
    Function = BBSetSpellOffsetTarget,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SpellName = "JunkName",
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      OffsetTargetVar = "Owner"
    }
  },
  {
    Function = BBSetSpellOffsetTarget,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellName = "JunkName",
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      OffsetTargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OrianaBlendDelay"
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "IzunaPercent",
      DestVarTable = "CharVars",
      SrcValue = 1
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "CastRange", SrcValue = 885}
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "Distance",
      Point1Var = "OwnerPos",
      Point2Var = "TargetPos"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Src2Var = "CastRange",
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 0,
          DistanceVar = "CastRange",
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 150,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 150,
          OffsetAngle = 0,
          PositionVar = "TargetPos"
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "GhostAlive",
      DestVarTable = "NextBuffVars",
      SrcVar = "GhostAlive",
      SrcVarTable = "CharVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Deployed", SrcValue = false}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ShiftWithoutMissile",
      SrcValue = false
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 2500,
      Flags = "AffectFriends AffectMinions AffectHeroes AffectUntargetable ",
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
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "TargetPos"}
      },
      {
        Function = BBDistanceBetweenObjectAndPoint,
        Params = {
          DestVar = "Distance",
          ObjectVar = "Owner",
          PointVar = "TargetPos"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Src2Var = "CastRange",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Owner",
              Distance = 0,
              DistanceVar = "CastRange",
              OffsetAngle = 0,
              PositionVar = "TargetPos"
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_NOT_HERO},
        SubBlocks = {
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Unit",
              SrcValue = true,
              Status = SetNoRender
            }
          }
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Unit", PositionVar = "CastPos"}
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Unit",
          BuffName = "OrianaGhost"
        }
      },
      {
        Function = BBDistanceBetweenPoints,
        Params = {
          DestVar = "Distance",
          Point1Var = "CastPos",
          Point2Var = "TargetPos"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Value2 = 75,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TargetPos",
              DestVarTable = "NextBuffVars",
              SrcVar = "TargetPos"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CastPos",
              DestVarTable = "NextBuffVars",
              SrcVar = "CastPos"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "OrianaIzuna",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
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
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Nothing",
              PosVar = "TargetPos",
              EndPosVar = "TargetPos",
              OverrideCastPosition = true,
              OverrideCastPosVar = "CastPos",
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
              DestVar = "ShiftWithoutMissile",
              SrcValue = true
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
        Function = BBIf,
        Params = {
          Src1Var = "GhostAlive",
          Src1VarTable = "CharVars",
          Value2 = true,
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Owner", PositionVar = "CastPos"}
          },
          {
            Function = BBDistanceBetweenPoints,
            Params = {
              DestVar = "Distance",
              Point1Var = "CastPos",
              Point2Var = "TargetPos"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Distance",
              Value2 = 75,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "TargetPos",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "TargetPos"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "CastPos",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "CastPos"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "OrianaIzuna",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
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
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Owner",
                  TargetVar = "Nothing",
                  PosVar = "TargetPos",
                  EndPosVar = "TargetPos",
                  OverrideCastPosition = true,
                  OverrideCastPosVar = "CastPos",
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
                  DestVar = "ShiftWithoutMissile",
                  SrcValue = true
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
      Src1Var = "ShiftWithoutMissile",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSpawnMinion,
        Params = {
          Name = "TheDoomBall",
          Skin = "Oriana_Ball",
          AiScript = "idle.lua",
          PosVar = "TargetPos",
          Team = TEAM_ORDER,
          TeamVar = "TeamID",
          Stunned = false,
          Rooted = true,
          Silenced = false,
          Invulnerable = true,
          MagicImmune = true,
          IgnoreCollision = true,
          Placemarker = true,
          VisibilitySize = 0,
          DestVar = "Other3",
          GoldRedirectTargetVar = "Owner"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "OrianaGhost",
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
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Other3",
          AttackerVar = "Owner",
          BuffName = "OrianaGhostMinion",
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
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "TargetPos",
          EffectName = "Oriana_Izuna_nova.troy",
          Flags = 0,
          EffectIDVar = "Temp",
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
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Other3",
          Range = 175,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BaseDamage",
              SrcValueByLevel = {
                60,
                100,
                140,
                180,
                220
              }
            }
          },
          {
            Function = BBGetStat,
            Params = {
              Stat = GetFlatMagicDamageMod,
              TargetVar = "Owner",
              DestVar = "AP"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "AP",
              Src1Value = 0,
              Src2Value = 0.6,
              DestVar = "BonusDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BonusDamage",
              Src2Var = "BaseDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TotalDamage",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "TotalDamage",
              Src2Var = "IzunaPercent",
              Src2VarTable = "CharVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "TotalDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "IzunaPercent",
              Src2VarTable = "CharVars",
              Src1Value = 0.9,
              Src2Value = 0,
              DestVar = "IzunaPercent",
              DestVarTable = "CharVars",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "IzunaPercent",
              Src2VarTable = "CharVars",
              Src1Value = 0.4,
              Src2Value = 0,
              DestVar = "IzunaPercent",
              DestVarTable = "CharVars",
              MathOp = MO_MAX
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TotalDamage",
              DestVarTable = "NextBuffVars",
              SrcVar = "TotalDamage"
            }
          },
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Unit",
              CasterVar = "Nothing",
              BuffName = "OrianaIzunaDamage"
            },
            SubBlocks = {
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "OrianaIzunaDamage",
                  BuffAddType = BUFF_RENEW_EXISTING,
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
              }
            }
          }
        }
      }
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
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = 90,
      PositionVar = "LeftPoint"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 500,
      OffsetAngle = -90,
      PositionVar = "RightPoint"
    }
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "LeftDistance",
      Point1Var = "CastPos",
      Point2Var = "LeftPoint"
    }
  },
  {
    Function = BBDistanceBetweenPoints,
    Params = {
      DestVar = "RightDistance",
      Point1Var = "CastPos",
      Point2Var = "RightPoint"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "LeftDistance",
      Src2Var = "RightDistance",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBPlayAnimation,
        Params = {
          AnimationName = "Spell1b",
          ScaleTime = 1,
          TargetVar = "Owner",
          Loop = true,
          Blend = false,
          Lock = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBPlayAnimation,
        Params = {
          AnimationName = "Spell1",
          ScaleTime = 1,
          TargetVar = "Owner",
          Loop = true,
          Blend = false,
          Lock = false
        }
      }
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghostself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianablenddelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaizuna"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "oriana_ball"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghostminion"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "oriana_izuna_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaizunadamage"
    }
  },
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
  }
}
