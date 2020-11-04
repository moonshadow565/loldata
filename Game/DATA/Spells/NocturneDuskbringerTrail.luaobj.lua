BuffTextureName = "Nocturne_Duskbringer.dds"
BuffName = "NocturneDuskbringerTrail"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "LastPosition",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "CasterID"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.25,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetPointByUnitFacingOffset,
        Params = {
          UnitVar = "Owner",
          Distance = 0,
          OffsetAngle = 0,
          PositionVar = "CurPos"
        }
      },
      {
        Function = BBDistanceBetweenPoints,
        Params = {
          DestVar = "Distance",
          Point1Var = "LastPosition",
          Point1VarTable = "InstanceVars",
          Point2Var = "CurPos"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Value2 = 25,
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "DarkPath",
              Skin = "testcube",
              AiScript = "idle.lua",
              PosVar = "CurPos",
              Team = TEAM_CASTER,
              TeamVar = "CasterID",
              Stunned = true,
              Rooted = true,
              Silenced = true,
              Invulnerable = true,
              MagicImmune = false,
              IgnoreCollision = true,
              Placemarker = true,
              VisibilitySize = 0,
              DestVar = "Other3",
              GoldRedirectTargetVar = "Nothing"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "HastePercent",
              DestVarTable = "NextBuffVars",
              SrcValue = 0,
              SrcValueByLevel = {
                0.15,
                0.2,
                0.25,
                0.3,
                0.35
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "BonusAD",
              DestVarTable = "NextBuffVars",
              SrcValue = 0,
              SrcValueByLevel = {
                25,
                35,
                45,
                55,
                65
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Other3",
              AttackerVar = "Attacker",
              BuffName = "NocturneDuskbringer",
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "LastPosition",
              DestVarTable = "InstanceVars",
              SrcVar = "CurPos"
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
      Name = "nocturneduskbringer"
    }
  }
}
