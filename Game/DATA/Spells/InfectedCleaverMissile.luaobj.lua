NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "DrMundo_InfectedCleaver.dds"
BuffName = "InfectedCleaverDebuff"
SpellDamageRatio = 1
SpellFXOverrideSkins = {"MundoMundo"}
TriggersSpellCasts = false
PopupMessage1 = "game_floatingtext_Slowed"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MoveMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "Global_Slow.troy",
      Flags = 0,
      EffectIDVar = "slow",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "slow",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveMod",
      SrcVar = "MoveMod",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMultiplicativeMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveMod",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetSkinID,
    Params = {UnitVar = "Owner", SkinIDVar = "MundoID"}
  },
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Target",
      DestVar = "IsStealthed",
      Status = GetStealthed
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsStealthed",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MinDamage",
          SrcValueByLevel = {
            80,
            130,
            180,
            230,
            280
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MoveMod",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            -0.4,
            -0.4,
            -0.4,
            -0.4,
            -0.4
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageMod",
          SrcValueByLevel = {
            0.15,
            0.18,
            0.21,
            0.23,
            0.25
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "MaxDamage",
          SrcValueByLevel = {
            300,
            400,
            500,
            600,
            700
          }
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "Health",
          OwnerVar = "Target",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Health",
          Src2Var = "DamageMod",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "PercentDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MinDamage",
          Src2Var = "PercentDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "tempDamage",
          MathOp = MO_MAX
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "tempDamage",
          Src2Var = "MaxDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageDealt",
          MathOp = MO_MIN
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Target",
          Damage = 0,
          DamageVar = "DamageDealt",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_STACKS_AND_OVERLAPS,
          StacksExclusive = true,
          BuffType = BUFF_Slow,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "HealthReturn",
          SrcValueByLevel = {
            25,
            30,
            35,
            40,
            45
          }
        }
      },
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "HealthReturn",
          HealerVar = "Owner"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MundoID",
          Value2 = 4,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "dr_mundo_as_mundo_infected_cleaver_tar",
              Flags = 0,
              EffectIDVar = "hit",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
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
              EffectName = "dr_mundo_infected_cleaver_tar.troy",
              Flags = 0,
              EffectIDVar = "hit",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false
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
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MinDamage",
              SrcValueByLevel = {
                80,
                130,
                180,
                230,
                280
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MoveMod",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                -0.4,
                -0.4,
                -0.4,
                -0.4,
                -0.4
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageMod",
              SrcValueByLevel = {
                0.15,
                0.18,
                0.21,
                0.23,
                0.25
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MaxDamage",
              SrcValueByLevel = {
                300,
                400,
                500,
                600,
                700
              }
            }
          },
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "Health",
              OwnerVar = "Target",
              Function = GetHealth,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "Health",
              Src2Var = "DamageMod",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "PercentDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "MinDamage",
              Src2Var = "PercentDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "tempDamage",
              MathOp = MO_MAX
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "tempDamage",
              Src2Var = "MaxDamage",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageDealt",
              MathOp = MO_MIN
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "DamageDealt",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_DEFAULT,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
              StacksExclusive = true,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 2,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBDestroyMissile,
            Params = {
              MissileIDVar = "MissileNetworkID"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "MundoID",
              Value2 = 4,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "dr_mundo_as_mundo_infected_cleaver_tar",
                  Flags = 0,
                  EffectIDVar = "hit",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
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
                  EffectName = "dr_mundo_infected_cleaver_tar.troy",
                  Flags = 0,
                  EffectIDVar = "hit",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamID",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false
                }
              }
            }
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 0,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "HealthReturn",
              SrcValueByLevel = {
                25,
                30,
                35,
                40,
                45
              }
            }
          },
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "HealthReturn",
              HealerVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Target",
              ResultVar = "CanSee"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CanSee",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "MinDamage",
                  SrcValueByLevel = {
                    80,
                    130,
                    180,
                    230,
                    280
                  }
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "MoveMod",
                  DestVarTable = "NextBuffVars",
                  SrcValueByLevel = {
                    -0.4,
                    -0.4,
                    -0.4,
                    -0.4,
                    -0.4
                  }
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageMod",
                  SrcValueByLevel = {
                    0.15,
                    0.18,
                    0.21,
                    0.23,
                    0.25
                  }
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "MaxDamage",
                  SrcValueByLevel = {
                    300,
                    400,
                    500,
                    600,
                    700
                  }
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "Health",
                  OwnerVar = "Target",
                  Function = GetHealth,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Health",
                  Src2Var = "DamageMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "PercentDamage",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "MinDamage",
                  Src2Var = "PercentDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "tempDamage",
                  MathOp = MO_MAX
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "tempDamage",
                  Src2Var = "MaxDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageDealt",
                  MathOp = MO_MIN
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "DamageDealt",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_DEFAULT,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Target",
                  AttackerVar = "Attacker",
                  BuffAddType = BUFF_STACKS_AND_OVERLAPS,
                  StacksExclusive = true,
                  BuffType = BUFF_Slow,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBDestroyMissile,
                Params = {
                  MissileIDVar = "MissileNetworkID"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "MundoID",
                  Value2 = 4,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Target",
                      EffectName = "dr_mundo_as_mundo_infected_cleaver_tar",
                      Flags = 0,
                      EffectIDVar = "hit",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
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
                      EffectName = "dr_mundo_infected_cleaver_tar.troy",
                      Flags = 0,
                      EffectIDVar = "hit",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
                      FollowsGroundTilt = false
                    }
                  }
                }
              },
              {
                Function = BBGetSlotSpellInfo,
                Params = {
                  DestVar = "Level",
                  SpellSlotValue = 0,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  OwnerVar = "Owner",
                  Function = GetSlotSpellLevel
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "HealthReturn",
                  SrcValueByLevel = {
                    25,
                    30,
                    35,
                    40,
                    45
                  }
                }
              },
              {
                Function = BBIncHealth,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  DeltaVar = "HealthReturn",
                  HealerVar = "Owner"
                }
              }
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
      Name = "global_slow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "dr_mundo_infected_cleaver_tar.troy"
    }
  }
}
