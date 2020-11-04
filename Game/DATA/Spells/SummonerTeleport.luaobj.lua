NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Summoner_teleport.dds"
BuffName = "Teleport"
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Silence,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Fear,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Net,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Sleep,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Stun,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Taunt,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {}
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CastPosition",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
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
          SrcValue = false,
          Status = SetGhosted
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
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CastPosition",
          SrcVar = "CastPosition",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBTeleportToPosition,
        Params = {
          OwnerVar = "Owner",
          CastPositionName = "CastPosition"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "summoner_teleportarrive.troy",
          Flags = 0,
          EffectIDVar = "akc",
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
        Function = BBSetStatus,
        Params = {
          TargetVar = "Owner",
          SrcValue = false,
          Status = SetGhosted
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
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
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
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
          Src1Value = 300,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeleportCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "TeleportCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_SUBTRACT
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Target",
      BuffName = "Teleport_DeathRemoval",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Interal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Cast.troy",
      Flags = 0,
      EffectIDVar = "CastParticle",
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
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Teleport.troy",
      Flags = 0,
      EffectIDVar = "ak",
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
    Function = BBGetRandomPointInAreaUnit,
    Params = {
      TargetVar = "Target",
      Radius = 100,
      InnerRadius = 50,
      ResultVar = "CastPosition"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CastPosition",
      DestVarTable = "NextBuffVars",
      SrcVar = "CastPosition"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BuffDuration",
      SrcValue = 4
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeleportDelayBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "TeleportDelayBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 4,
          Src2Value = 0,
          DestVar = "BuffDuration",
          MathOp = MO_SUBTRACT
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Stun,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0.05,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "BuffDuration",
      TickRate = 0
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "Teleport_Turret",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "BuffDuration",
              TickRate = 0
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
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "Teleport_Target",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0.1,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "BuffDuration",
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
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_teleportarrive.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_teleport.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teleport_turret"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teleport_target"
    }
  }
}
