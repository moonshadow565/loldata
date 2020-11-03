TargetExecuteBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MyMaxHealth",
      OwnerVar = "Target",
      Function = GetMaxPAR,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Target",
      DestVar = "TargetTeamID"
    }
  },
  {
    Function = BBGetUnitSkinName,
    Params = {TargetVar = "Owner", DestVar = "SkinName"}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "OdinGolemBombBuff"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "TargetTeamID",
          Value2 = TEAM_NEUTRAL,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "MyMaxHealth",
              Src1Value = 0.06,
              Src2Value = 0,
              DestVar = "HealthToDecreaseBy",
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
            Function = BBMath,
            Params = {
              Src2Var = "MyMaxHealth",
              Src1Value = 0.12,
              Src2Value = 0,
              DestVar = "HealthToDecreaseBy",
              MathOp = MO_MULTIPLY
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
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinSuperMinion"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "TargetTeamID",
              Value2 = TEAM_NEUTRAL,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src2Var = "MyMaxHealth",
                  Src1Value = 0.015,
                  Src2Value = 0,
                  DestVar = "HealthToDecreaseBy",
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
                Function = BBMath,
                Params = {
                  Src2Var = "MyMaxHealth",
                  Src1Value = 0.03,
                  Src2Value = 0,
                  DestVar = "HealthToDecreaseBy",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "TargetTeamID",
          Value2 = TEAM_NEUTRAL,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "MyMaxHealth",
              Src1Value = 0.01,
              Src2Value = 0,
              DestVar = "HealthToDecreaseBy",
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
            Function = BBMath,
            Params = {
              Src2Var = "MyMaxHealth",
              Src1Value = 0.02,
              Src2Value = 0,
              DestVar = "HealthToDecreaseBy",
              MathOp = MO_MULTIPLY
            }
          }
        }
      }
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "MyTeamID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetTeamID",
      Value2 = TEAM_NEUTRAL,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "MyTeamID",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "HealthToDecreaseBy",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "HealthToDecreaseBy",
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
            Function = BBMath,
            Params = {
              Src1Var = "HealthToDecreaseBy",
              Src1Value = 0,
              Src2Value = -1,
              DestVar = "HealthToDecreaseBy",
              MathOp = MO_MULTIPLY
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
        Function = BBMath,
        Params = {
          Src1Var = "HealthToDecreaseBy",
          Src1Value = 0,
          Src2Value = -1,
          DestVar = "HealthToDecreaseBy",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetTeamID",
      Src2Var = "MyTeamID",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Target",
          Delta = 0,
          PARType = PAR_MANA,
          DeltaVar = "HealthToDecreaseBy"
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetTeamID",
      Value2 = TEAM_NEUTRAL,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "HealthPercent",
          OwnerVar = "Target",
          Function = GetHealthPercent,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "AttackerMaxHealth",
          OwnerVar = "Attacker",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "OdinGolemBombBuff"
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "AttackerMaxHealth",
              Src1Value = 0.01,
              Src2Value = 0,
              DestVar = "DamageReturn",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Attacker",
              EffectName = "Thornmail_tar.troy",
              Flags = 0,
              EffectIDVar = "NoEstada",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false,
              FollowsGroundTilt = false,
              FacesTarget = false
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
              AttackerVar = "Nothing",
              BuffName = "SummonerOdinPromote"
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src2Var = "AttackerMaxHealth",
                  Src1Value = 0.075,
                  Src2Value = 0,
                  DestVar = "DamageReturn",
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
                Function = BBMath,
                Params = {
                  Src2Var = "AttackerMaxHealth",
                  Src1Value = 0.25,
                  Src2Value = 0,
                  DestVar = "DamageReturn",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Attacker",
                  EffectName = "Thornmail_tar.troy",
                  Flags = 0,
                  EffectIDVar = "NoEstada",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Target",
          CallForHelpAttackerVar = "Target",
          TargetVar = "Owner",
          Damage = 0,
          DamageVar = "DamageReturn",
          DamageType = TRUE_DAMAGE,
          SourceDamageType = DAMAGESOURCE_RAW,
          PercentOfAttack = 1,
          SpellDamageRatio = 0,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "OdinMinionSpellAttack",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odingolembombbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinsuperminion"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thornmail_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerodinpromote"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinminionspellattack"
    }
  }
}
