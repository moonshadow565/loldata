NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Blitzcrank_Overdrive.dds"
BuffName = "Overdrive"
AutoBuffActivateEffect = ""
AutoCooldownByLevel = {
  90,
  90,
  90,
  18,
  14
}
SpellFXOverrideSkins = {
  "PiltoverCustomsBlitz"
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Owner",
      SkinIDVar = "BlitzcrankID",
      SkinIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "BlitzcrankID",
      Src1VarTable = "InstanceVars",
      Value2 = 4,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "SteamGolem_Piltover_Overdrive.troy",
          Flags = 0,
          EffectIDVar = "One",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_PIPE_L_1",
          TargetObjectVar = "Owner",
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
          EffectName = "SteamGolem_Piltover_Overdrive.troy",
          Flags = 0,
          EffectIDVar = "Two",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_PIPE_L_2",
          TargetObjectVar = "Owner",
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
          EffectName = "SteamGolem_Piltover_Overdrive.troy",
          Flags = 0,
          EffectIDVar = "Three",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_PIPE_L_3",
          TargetObjectVar = "Owner",
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
          EffectName = "SteamGolem_Piltover_Overdrive.troy",
          Flags = 0,
          EffectIDVar = "Four",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_PIPE_L_4",
          TargetObjectVar = "Owner",
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
          EffectName = "SteamGolem_Piltover_Overdrive.troy",
          Flags = 0,
          EffectIDVar = "Five",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_PIPE_R_1",
          TargetObjectVar = "Owner",
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
          EffectName = "SteamGolem_Piltover_Overdrive.troy",
          Flags = 0,
          EffectIDVar = "Six",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_PIPE_R_2",
          TargetObjectVar = "Owner",
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
          EffectName = "SteamGolem_Piltover_Overdrive.troy",
          Flags = 0,
          EffectIDVar = "Seven",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_PIPE_R_3",
          TargetObjectVar = "Owner",
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
          EffectName = "SteamGolem_Piltover_Overdrive.troy",
          Flags = 0,
          EffectIDVar = "Eight",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BUFFBONE_CSTM_PIPE_R_4",
          TargetObjectVar = "Owner",
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
          EffectName = "Overdrive_buf.troy",
          Flags = 0,
          EffectIDVar = "ClassicOverdrive",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
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
          EffectName = "SteamGolem_Piltover_Overdrive_Tires.troy",
          Flags = 0,
          EffectIDVar = "WheelOne",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BL_wheel",
          TargetObjectVar = "Owner",
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
          EffectName = "SteamGolem_Piltover_Overdrive_Tires.troy",
          Flags = 0,
          EffectIDVar = "WheelTwo",
          EffectIDVarTable = "InstanceVars",
          BoneName = "BR_wheel",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
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
          EffectName = "Overdrive_buf.troy",
          Flags = 0,
          EffectIDVar = "ClassicOverdrive",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "BlitzcrankID",
      Src1VarTable = "InstanceVars",
      Value2 = 4,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "One",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Two",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Three",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Four",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Five",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Six",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Seven",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "Eight",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "WheelOne",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "WheelTwo",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "ClassicOverdrive",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "ClassicOverdrive",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        0.16,
        0.2,
        0.24,
        0.28,
        0.32
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        0.3,
        0.38,
        0.46,
        0.54,
        0.62
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Haste,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        8,
        8,
        8,
        8,
        8
      },
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolem_piltover_overdrive.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "overdrive_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolem_piltover_overdrive_tires.troy"
    }
  }
}
