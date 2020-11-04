NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 4
BuffTextureName = "Janna_ReapTheWhirlwind.dds"
BuffName = "Reap The Whirlwind"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TickAmount",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
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
          BindObjectVar = "Owner",
          EffectName = "ReapTheWhirlwind_red_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "ReapTheWhirlwind_green_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
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
          EffectName = "ReapTheWhirlwind_red_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "ReapTheWhirlwind_green_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 700,
      Flags = "AffectEnemies AffectFriends AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Unit",
          CompareOp = CO_SAME_TEAM
        },
        SubBlocks = {
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "Temp1",
              OwnerVar = "Unit",
              Function = GetHealthPercent,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Temp1",
              Value2 = 1,
              CompareOp = CO_LESS_THAN
            },
            SubBlocks = {
              {
                Function = BBApplyAssistMarker,
                Params = {
                  Duration = 10,
                  TargetVar = "Unit",
                  SourceVar = "Owner"
                }
              },
              {
                Function = BBIncHealth,
                Params = {
                  TargetVar = "Unit",
                  Delta = 0,
                  DeltaVar = "TickAmount",
                  DeltaVarTable = "InstanceVars",
                  HealerVar = "Owner"
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
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Owner", PositionVar = "Center"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Center",
              DestVarTable = "NextBuffVars",
              SrcVar = "Center"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Distance",
              DestVarTable = "NextBuffVars",
              SrcValue = 1000
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "IdealDistance",
              DestVarTable = "NextBuffVars",
              SrcValue = 1000
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Gravity",
              DestVarTable = "NextBuffVars",
              SrcValue = 10
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Speed",
              DestVarTable = "NextBuffVars",
              SrcValue = 1200
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "MoveAway",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.75,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          }
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 700,
      Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Unit",
          CompareOp = CO_SAME_TEAM
        },
        SubBlocks = {
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "Temp1",
              OwnerVar = "Unit",
              Function = GetHealthPercent,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Temp1",
              Value2 = 1,
              CompareOp = CO_LESS_THAN
            },
            SubBlocks = {
              {
                Function = BBApplyAssistMarker,
                Params = {
                  Duration = 10,
                  TargetVar = "Unit",
                  SourceVar = "Owner"
                }
              },
              {
                Function = BBIncHealth,
                Params = {
                  TargetVar = "Unit",
                  Delta = 0,
                  DeltaVar = "TickAmount",
                  DeltaVarTable = "InstanceVars",
                  HealerVar = "Owner"
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MoveSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValue = -0.4
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "Slow",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
              StacksExclusive = true,
              BuffType = BUFF_Slow,
              MaxStack = 100,
              NumberOfStacks = 1,
              Duration = 1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          }
        }
      }
    }
  }
}
ChannelingStartBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseTickAmount",
      SrcValueByLevel = {
        45,
        65,
        85
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatMagicDamageMod,
      TargetVar = "Owner",
      DestVar = "APAmount"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "APAmount",
      Src1Value = 0,
      Src2Value = 0.175,
      DestVar = "APTickBonus",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BaseTickAmount",
      Src2Var = "APTickBonus",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TickAmount",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TickAmount",
      DestVarTable = "NextBuffVars",
      SrcVar = "TickAmount"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 10,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.5,
      CanMitigateDuration = false
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ReapTheWhirlwind"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ReapTheWhirlwind"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "reapthewhirlwind_red_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "reapthewhirlwind_green_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "moveaway"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "reapthewhirlwind"
    }
  }
}
