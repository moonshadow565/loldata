BuffTextureName = "Teemo_EagleEye.dds"
BuffName = "Eagle Eye"
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "lastTooltip",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 30,
      OffsetAngle = 180,
      PositionVar = "CurPos"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "AcidTrail",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "CurPos",
      Team = TEAM_CASTER,
      TeamVar = "TeamID",
      Stunned = true,
      Rooted = false,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = false,
      IgnoreCollision = true,
      VisibilitySize = 0,
      DestVar = "Other3",
      GoldRedirectTargetVar = "Attacker"
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Attacker",
      DestVar = "MoveSpeed"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MoveSpeed",
      Src1Value = 0,
      Src2Value = 2500,
      DestVar = "MoveSpeedMod",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcVar = "MoveSpeedMod"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Owner",
      BuffName = "TrailblazerApplicator",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "TrailDuration",
      DurationVarTable = "CharVars",
      TickRate = 0
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 10,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "tooltipAmount",
          SrcValueByLevel = {
            6,
            6,
            6,
            8,
            8,
            8,
            10,
            10,
            10,
            12,
            12,
            12,
            14,
            14,
            14,
            16,
            16,
            16
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "tooltipAmount",
          Src2Var = "lastTooltip",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "lastTooltip",
              DestVarTable = "InstanceVars",
              SrcVar = "tooltipAmount"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "tooltipAmount",
              Index = 1
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "trailblazerapplicator"
    }
  }
}
