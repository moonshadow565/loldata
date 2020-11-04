BuffTextureName = "48thSlave_Tattoo.dds"
BuffName = "CrestoftheAncientGolem"
AutoBuffActivateEffect = ""
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "NeutralMonster_buf_blue_defense.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CooldownVar",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      Delta = 0,
      DeltaByLevel = {
        -0.165,
        -0.17,
        -0.175,
        -0.18,
        -0.185,
        -0.19,
        -0.195,
        -0.2,
        -0.205,
        -0.21,
        -0.215,
        -0.22,
        -0.225,
        -0.23,
        -0.235,
        -0.24,
        -0.245,
        -0.25
      }
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxMana",
      OwnerVar = "Target",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxMana",
      Src1Value = 0,
      Src2Value = 0.015,
      DestVar = "ManaRegen",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncFlatPARRegenMod,
    Params = {
      PARType = PAR_MANA,
      TargetVar = "Owner",
      DeltaVar = "ManaRegen",
      Delta = 0
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxEnergy",
      OwnerVar = "Target",
      Function = GetMaxPAR,
      PARType = PAR_ENERGY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MaxEnergy",
      Src1Value = 0,
      Src2Value = 0.015,
      DestVar = "EnergyRegen",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIncFlatPARRegenMod,
    Params = {
      PARType = PAR_ENERGY,
      TargetVar = "Owner",
      DeltaVar = "EnergyRegen",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
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
          DestVar = "CurrentCD",
          SrcValueByLevel = {
            16.5,
            17,
            17.5,
            18,
            18.5,
            19,
            19.5,
            2,
            20.5,
            21,
            21.5,
            22,
            22.5,
            23,
            23.5,
            24,
            24.5,
            25
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CurrentCD",
          Src2Var = "CooldownVar",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CooldownVar",
              DestVarTable = "InstanceVars",
              SrcVar = "CurrentCD"
            }
          },
          {
            Function = BBSetBuffToolTipVar,
            Params = {
              Value = 0,
              ValueVar = "CurrentCD",
              Index = 1
            }
          }
        }
      }
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "NewDuration",
              SrcValue = 150
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Attacker",
              AttackerVar = "Attacker",
              BuffName = "MonsterBuffs"
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src2Var = "NewDuration",
                  Src1Value = 1.15,
                  Src2Value = 0,
                  DestVar = "NewDuration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Attacker",
                  AttackerVar = "Attacker",
                  BuffName = "MonsterBuffs2"
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src2Var = "NewDuration",
                      Src1Value = 1.3,
                      Src2Value = 0,
                      DestVar = "NewDuration",
                      MathOp = MO_MULTIPLY
                    }
                  }
                }
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "NewDuration",
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
      Name = "neutralmonster_buf_blue_defense.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monsterbuffs"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monsterbuffs2"
    }
  }
}
