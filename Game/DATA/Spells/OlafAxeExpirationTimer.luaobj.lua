AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "olaf_axe_trigger.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
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
      Status = SetForceRenderParticles
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
      Status = SetNoRender
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
          EffectName = "olaf_axe_totem_team_id_red.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 400,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "olaf_axe_totem_team_id_green.troy",
          Flags = 0,
          EffectIDVar = "Particle1",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 400,
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
          EffectName = "olaf_axe_totem_team_id_red.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 400,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "olaf_axe_totem_team_id_green.troy",
          Flags = 0,
          EffectIDVar = "Particle1",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 400,
          SendIfOnScreenOrDiscard = false
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
      SrcValue = true,
      Status = SetNoRender
    }
  },
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
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "OlafAxeExpirationTimer2",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.25,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentBubbleRadiusMod,
      TargetVar = "Owner",
      Delta = -1
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
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
      Status = SetForceRenderParticles
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 250,
      Flags = "AffectEnemies AffectFriends AffectNeutral AffectHeroes ",
      IteratorVar = "Unit",
      BuffNameFilter = "OlafBerzerkerRage",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Unit",
          Src2Var = "Attacker",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Cooldown",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Unit",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Cooldown",
              Src1Value = 0,
              Src2Value = 6,
              DestVar = "Cooldown",
              MathOp = MO_SUBTRACT
            }
          },
          {
            Function = BBSetSlotSpellCooldownTime,
            Params = {
              SrcVar = "Cooldown",
              SrcValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              SpellSlotValue = 0,
              OwnerVar = "Unit"
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
          },
          {
            Function = BBGetUnitPosition,
            Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "olaf_axe_refresh_indicator.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Attacker",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = true
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "TeamID",
              Value2 = TEAM_ORDER,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Nothing",
                  PosVar = "OwnerPos",
                  EffectName = "olaf_axe_trigger_02.troy",
                  Flags = 0,
                  EffectIDVar = "a",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_ORDER,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 100,
                  SendIfOnScreenOrDiscard = true
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
                  BindObjectVar = "Nothing",
                  PosVar = "OwnerPos",
                  EffectName = "olaf_axe_trigger_02.troy",
                  Flags = 0,
                  EffectIDVar = "a",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_CHAOS,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 100,
                  SendIfOnScreenOrDiscard = true
                }
              }
            }
          },
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
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
      Name = "olaf_axe_trigger.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_axe_totem_team_id_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_axe_totem_team_id_green.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafaxeexpirationtimer2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "olafberzerkerrage"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_axe_refresh_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "olaf_axe_trigger_02.troy"
    }
  }
}
