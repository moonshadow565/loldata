BuffTextureName = "Jester_ManiacalCloak2.dds"
BuffName = "Deceive"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStealthed
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 0.2,
      fadeTime = 0,
      IDVar = "ID"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CastPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CritDmgBonus",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Teleported",
      DestVarTable = "InstanceVars",
      SrcValue = false
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
      SrcValue = false,
      Status = SetCanCast
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
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatCritChanceMod,
      TargetVar = "Owner",
      Delta = 1
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetStealthed
    }
  },
  {
    Function = BBPushCharacterFade,
    Params = {
      TargetVar = "Owner",
      FadeAmount = 1,
      fadeTime = 0
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentFlatCritChanceMod,
      TargetVar = "Owner",
      Delta = -1
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetStealthed
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Teleported",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "LifeTime",
          Value2 = 0.05,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CastPos",
              SrcVar = "CastPos",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBTeleportToPosition,
            Params = {OwnerVar = "Owner", CastPositionName = "CastPos"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Teleported",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanAttack
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanCast
            }
          },
          {
            Function = BBSetStatus,
            Params = {
              TargetVar = "Owner",
              SrcValue = true,
              Status = SetCanMove
            }
          }
        }
      }
    }
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CritDmgBonus",
      DestVarTable = "NextBuffVars",
      SrcVar = "CritDmgBonus",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DeceiveCritBonus",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 1
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "Owner",
      EffectName = "jackintheboxpoof2.troy",
      Flags = 0,
      EffectIDVar = "hi",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_NEUTRAL,
      FOWVisibilityRadius = 900,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "CastPos"}
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
      Point2Var = "CastPos"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Value2 = 575,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "CastPos"}
      },
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 575,
          OffsetAngle = 0,
          PositionVar = "CastPos"
        }
      }
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CritDmgBonus",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.5,
        -0.3,
        -0.1,
        0.1,
        0.3
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Invisibility,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 5.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deceivecritbonus"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jackintheboxpoof2.troy"
    }
  }
}
