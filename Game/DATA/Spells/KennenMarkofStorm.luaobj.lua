BuffTextureName = "Kennen_MarkOfStorm.dds"
BuffName = "KennenMarkOfStorm"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DoOnce",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      DestVarTable = "InstanceVars",
      TargetVar = "Owner",
      BuffName = "KennenMarkofStorm"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "DoOnce", SrcValue = false}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KennenParticleHolder",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 12,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Src1VarTable = "InstanceVars",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DoOnce",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KennenParticleHolder"
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "kennen_mos2.troy",
          Flags = 0,
          EffectIDVar = "GlobeTwo",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Src1VarTable = "InstanceVars",
      Value2 = 3,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Attacker",
          BuffName = "KennenMoSDiminish"
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Owner"}
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Attacker",
              Delta = 25,
              PARType = PAR_ENERGY
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "kennen_mos_tar.troy",
              Flags = 0,
              EffectIDVar = "part",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          },
          {
            Function = BBApplyStun,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Duration = 1.25
            }
          },
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "KennenMarkofStorm",
              NumStacks = 0
            }
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "KennenMoSDiminish",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 7,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
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
            Params = {TargetVar = "Owner"}
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Attacker",
              Delta = 25,
              PARType = PAR_ENERGY
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "kennen_mos_tar.troy",
              Flags = 0,
              EffectIDVar = "part",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          },
          {
            Function = BBApplyStun,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Owner",
              Duration = 0.6
            }
          },
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "KennenMarkofStorm",
              NumStacks = 0
            }
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Attacker",
                  BuffName = "KennenMoSDiminish",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 7,
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
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DoOnce",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "GlobeTwo",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenmarkofstorm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenparticleholder"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_mos2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_mos_tar.troy"
    }
  }
}
