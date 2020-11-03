NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "066_Sindoran_Shielding_Amulet.dds"
BuffName = "BansheesVeil"
AutoBuffActivateEffect = "bansheesveil_buf.troy"
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DurationMod",
          SrcValue = 0.5
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Attacker",
          CompareOp = CO_DIFFERENT_TEAM
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Snare,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Slow,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Fear,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Net,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Sleep,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Stun,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Taunt,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
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
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Duration",
      Value2 = 37037,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "SpellEffect_proc.troy",
          Flags = 0,
          EffectIDVar = "ar",
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
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "WillRemove",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Attacker",
          CompareOp = CO_DIFFERENT_TEAM
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Snare,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Slow,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Fear,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Net,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Sleep,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Stun,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_Taunt,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "DurationMod",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              }
            }
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillRemove",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinDebacleTimer",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 45,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "OdinDebacleCloak",
          ResetDuration = 0
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "WillRemove",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "DamageAmount",
          Src1Value = 0.5,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
BuffOnBeingSpellHitBuildingBlocks = {
  {
    Function = BBSetTriggerUnit,
    Params = {TriggerVar = "Attacker"}
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Owner"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "IsAttack", Info = GetIsAttackOverride}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsAttack",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DoesntBreakShields",
              Src1VarTable = "SpellVars",
              Value2 = false,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "WillRemove",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "SpellEffect_proc.troy",
                  Flags = 0,
                  EffectIDVar = "ar",
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
            Function = BBElseIf,
            Params = {
              Src1Var = "DoesntBreakShields",
              Src1VarTable = "SpellVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            }
          },
          {
            Function = BBElseIf,
            Params = {
              Src1Var = "DoesntTriggerSpellCasts",
              Src1VarTable = "SpellVars",
              Value2 = true,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "WillRemove",
                  DestVarTable = "InstanceVars",
                  SrcValue = true
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "SpellEffect_proc.troy",
                  Flags = 0,
                  EffectIDVar = "ar",
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "spelleffect_proc.troy"
    }
  }
}
