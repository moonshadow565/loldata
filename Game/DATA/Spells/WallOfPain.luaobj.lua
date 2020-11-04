NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Pos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Pos",
      SrcVar = "Pos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcVar = "MoveSpeedMod",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorMod",
      DestVarTable = "NextBuffVars",
      SrcVar = "ArmorMod",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Pos",
      Range = 75,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "WallofPainTarget",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Slow,
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
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Pos",
          SrcVar = "Pos",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MoveSpeedMod",
          DestVarTable = "NextBuffVars",
          SrcVar = "MoveSpeedMod",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ArmorMod",
          DestVarTable = "NextBuffVars",
          SrcVar = "ArmorMod",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Pos",
          Range = 75,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Unit",
              CasterVar = "Owner",
              BuffName = "WallofPainTarget"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "WallofPainTarget",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_Slow,
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
  }
}
SelfExecuteBuildingBlocks = {
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
      DestVar = "Iterations",
      SrcValueByLevel = {
        17,
        19,
        21,
        23,
        25
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LineWidth",
      SrcValueByLevel = {
        800,
        900,
        1000,
        1100,
        1200
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.4,
        -0.5,
        -0.6,
        -0.7,
        -0.8
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -15,
        -20,
        -25,
        -30,
        -35
      }
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
      IterationsVar = "Iterations",
      IteratorVar = "Pos"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Pos",
          DestVarTable = "NextBuffVars",
          SrcVar = "Pos"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_Internal,
          MaxStack = 50,
          NumberStacks = 1,
          Duration = 9,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0.1
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "FoundFirstPos",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "FirstPos", SrcVar = "Pos"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "FoundFirstPos",
              SrcValue = true
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "LastPos", SrcVar = "Pos"}
      }
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "hiu",
      Skin = "TestCubeRender",
      AiScript = "idle.lua",
      PosVar = "FirstPos",
      Team = TEAM_CASTER,
      TeamVar = "teamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      VisibilitySize = 300,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Other1",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "hiu",
      Skin = "TestCubeRender",
      AiScript = "idle.lua",
      PosVar = "LastPos",
      Team = TEAM_CASTER,
      TeamVar = "teamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      VisibilitySize = 300,
      DestVar = "Other2",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other2",
      AttackerVar = "Other2",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other2",
      AttackerVar = "Other1",
      BuffName = "WallOfPainBeam",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBLinkVisibility,
    Params = {Unit1Var = "Other1", Unit2Var = "Other2"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "hiu",
      Skin = "TestCubeRender",
      AiScript = "idle.lua",
      PosVar = "TargetPos",
      Team = TEAM_CASTER,
      TeamVar = "teamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = false,
      MagicImmune = false,
      IgnoreCollision = true,
      VisibilitySize = 300,
      VisibilitySizeVar = "LineWidth",
      DestVar = "Other3",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other3",
      AttackerVar = "Other3",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 7,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBLinkVisibility,
    Params = {Unit1Var = "Other1", Unit2Var = "Other3"}
  },
  {
    Function = BBLinkVisibility,
    Params = {Unit1Var = "Other2", Unit2Var = "Other3"}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wallofpaintarget"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "wallofpainbeam"
    }
  }
}
