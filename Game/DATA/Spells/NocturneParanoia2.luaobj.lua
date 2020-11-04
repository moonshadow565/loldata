NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Nocturne_Paranoia.dds"
BuffName = "NocturneParanoia"
AutoBuffActivateEffect = ""
CanCastBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanMove",
      Status = GetCanMove
    }
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanCast",
      Status = GetCanCast
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CanMove",
      Value2 = true,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "CanCast",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = true}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "NocturneParanoia"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamOfOwner",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachChampion,
            Params = {
              IteratorVar = "Unit",
              Team = TEAM_CHAOS,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "NocturneParanoiaTargeting"
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
            Function = BBForEachChampion,
            Params = {
              IteratorVar = "Unit",
              Team = TEAM_ORDER,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "NocturneParanoiaTargeting"
                }
              }
            }
          }
        }
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Attacker", PositionVar = "OwnerPos"}
      },
      {
        Function = BBGetUnitPosition,
        Params = {UnitVar = "Target", PositionVar = "TargetPos"}
      },
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Owner",
          ObjectVar2 = "Target"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "dashSpeed",
          DestVarTable = "NextBuffVars",
          SrcValue = 1800
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Distance",
          DestVarTable = "NextBuffVars",
          SrcVar = "Distance"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UnstoppableForceMarker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 6,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamOfOwner",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "NocturneParanoiaTeamTarget.troy",
              Flags = 0,
              EffectIDVar = "GreenDash",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
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
              BindObjectVar = "Target",
              EffectName = "NocturneParanoiaTeamTarget.troy",
              Flags = 0,
              EffectIDVar = "GreenDash",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "GreenDash",
          DestVarTable = "NextBuffVars",
          SrcVar = "GreenDash",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Target",
          BuffName = "NocturneParanoiaDash",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 6,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0.25,
          CanMitigateDuration = false,
          IsHiddenOnClient = true
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "NocturneParanoia"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoia"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiatargeting"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcemarker"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiateamtarget.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "nocturneparanoiadash"
    }
  }
}
