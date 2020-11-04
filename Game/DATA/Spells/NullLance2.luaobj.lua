AutoBuffActivateEffect = "Null_Lance_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Passthrough",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellSlowPercent",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.4,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Passthrough",
          Src1VarTable = "InstanceVars",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "SpellCD1",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "SpellCD1",
              Src2Var = "SpellSlowPercent",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "SpellCD1a",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcVar = "SpellCD1a",
              SrcValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Owner"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "ChronoRefresh_tar.troy",
              Flags = 0,
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
        Function = BBIf,
        Params = {
          Src1Var = "Passthrough",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "SpellCD2",
              SpellSlotValue = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "SpellCD2",
              Src2Var = "SpellSlowPercent",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "SpellCD2a",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcVar = "SpellCD2a",
              SrcValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              SpellSlotValue = 1,
              OwnerVar = "Owner"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "ChronoRefresh_tar.troy",
              Flags = 0,
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
        Function = BBIf,
        Params = {
          Src1Var = "Passthrough",
          Src1VarTable = "InstanceVars",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "SpellCD3",
              SpellSlotValue = 2,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "SpellCD3",
              Src2Var = "SpellSlowPercent",
              Src2VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "SpellCD3a",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcVar = "SpellCD3a",
              SrcValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              SpellSlotValue = 2,
              OwnerVar = "Owner"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "ChronoRefresh_tar.troy",
              Flags = 0,
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "chronorefresh_tar.troy"
    }
  }
}
