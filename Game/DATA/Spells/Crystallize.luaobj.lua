NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
OnBuffActivateBuildingBlocks = {
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
      Status = SetCanAttack
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
      SrcValue = false,
      Status = SetCanMove
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
      Status = SetForceRenderParticles
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 150,
      Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
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
              SrcValue = 250
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
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "CrystallizePush",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Stun,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 0.25,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 0,
          SpellDamageRatio = 0
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
      SrcValue = false,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Target",
      Damage = 10000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
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
      Status = SetCanAttack
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
      SrcValue = false,
      Status = SetCanMove
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Crystallize"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
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
          DestVar = "MeltingTime",
          DestVarTable = "InstanceVars",
          SrcValue = 5
        }
      },
      {
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "TargetPos"}
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
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
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "teamID"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Iter",
          SrcValueByLevel = {
            4,
            5,
            6,
            7,
            8
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "LineWidth",
          SrcValueByLevel = {
            400,
            500,
            600,
            700,
            800
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "FoundFirstPos",
          SrcValue = false
        }
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 9999,
          OffsetAngle = 0,
          PositionVar = "FacingPoint"
        }
      },
      {
        Function = BBForEachPointOnLine,
        Params = {
          CenterVar = "OwnerPos",
          FaceTowardsPosVar = "TargetPos",
          Size = 0,
          SizeVar = "LineWidth",
          PushForward = 0,
          PushForwardVar = "Distance",
          Iterations = 0,
          IterationsVar = "Iter",
          IteratorVar = "Pos"
        },
        SubBlocks = {
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "IceBlock",
              Skin = "IceBlock",
              AiScript = "idle.lua",
              PosVar = "Pos",
              Team = TEAM_UNKNOWN,
              TeamVar = "teamID",
              Stunned = true,
              Rooted = true,
              Silenced = true,
              Invulnerable = true,
              MagicImmune = false,
              IgnoreCollision = true,
              VisibilitySize = 0,
              DestVar = "Other2",
              GoldRedirectTargetVar = "Nothing"
            }
          },
          {
            Function = BBFaceDirection,
            Params = {
              TargetVar = "Other2",
              LocationVar = "FacingPoint"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Other2",
              AttackerVar = "Owner",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
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
      Name = "crystallizepush"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "crystallize"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "iceblock"}
  }
}
