NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Poppy_DiplomaticImmunity.dds"
BuffName = "PoppyDiplomaticImmunity"
AutoBuffActivateEffect = ""
AutoBuffActivateEvent = ""
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Attacker",
          AttackerVar = "Owner",
          BuffName = "PoppyDITarget"
        },
        SubBlocks = {
          {
            Function = BBSetReturnValue,
            Params = {SrcValue = true}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Type",
              Value2 = BUFF_CombatEnchancer,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetReturnValue,
                Params = {SrcValue = true}
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSetReturnValue,
                Params = {SrcValue = false}
              }
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
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
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
          EffectName = "DiplomaticImmunity_buf.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBForEachChampion,
        Params = {IteratorVar = "Unit", Team = TEAM_CHAOS},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Caster",
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "DiplomaticImmunity_tar.troy",
                  Flags = 0,
                  EffectIDVar = "Particle2",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Owner",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_ORDER,
                  FOWVisibilityRadius = 500,
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
                  EffectName = "DiplomaticImmunity_buf.troy",
                  Flags = 0,
                  EffectIDVar = "Particle2",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Owner",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_CHAOS,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_ORDER,
                  FOWVisibilityRadius = 500,
                  SendIfOnScreenOrDiscard = false
                }
              }
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "DiplomaticImmunity_buf.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBForEachChampion,
        Params = {IteratorVar = "Unit", Team = TEAM_ORDER},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Caster",
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "DiplomaticImmunity_tar.troy",
                  Flags = 0,
                  EffectIDVar = "Particle2",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Owner",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_ORDER,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_CHAOS,
                  FOWVisibilityRadius = 500,
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
                  EffectName = "DiplomaticImmunity_buf.troy",
                  Flags = 0,
                  EffectIDVar = "Particle2",
                  EffectIDVarTable = "InstanceVars",
                  TargetObjectVar = "Owner",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_ORDER,
                  UseSpecificUnit = true,
                  FOWTeam = TEAM_ORDER,
                  FOWVisibilityRadius = 500,
                  SendIfOnScreenOrDiscard = false
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
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Owner",
      BuffName = "PoppyDITarget"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_SUBTRACT
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "PoppyDITarget",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        6,
        7,
        8
      },
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyditarget"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diplomaticimmunity_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "diplomaticimmunity_tar.troy"
    }
  }
}
