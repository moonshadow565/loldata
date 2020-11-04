AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Owner",
      SkinIDVar = "KennenSkinID"
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
        Function = BBIf,
        Params = {
          Src1Var = "KennenSkinID",
          Value2 = 3,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "kennen_ss_aoe_green.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              TargetPosVar = "Owner",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "kennen_ss_aoe_red.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              TargetPosVar = "Owner",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
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
              PosVar = "Owner",
              EffectName = "kennen_ss_aoe_green.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              TargetPosVar = "Owner",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "kennen_ss_aoe_red.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              TargetPosVar = "Owner",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
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
        Params = {
          Src1Var = "KennenSkinID",
          Value2 = 3,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "kennen_ss_aoe_red.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              TargetPosVar = "Owner",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "kennen_ss_aoe_green.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              TargetPosVar = "Owner",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
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
              PosVar = "Owner",
              EffectName = "kennen_ss_aoe_red.troy",
              Flags = 0,
              EffectIDVar = "Particle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              TargetPosVar = "Owner",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "kennen_ss_aoe_green.troy",
              Flags = 0,
              EffectIDVar = "Particle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              TargetPosVar = "Owner",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      DestVarTable = "InstanceVars",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
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
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.5,
          TrackTimeVar = "LastTimeExecuted",
          TrackTimeVarTable = "InstanceVars",
          ExecuteImmediately = true
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetAreaRandom,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 550,
              Flags = "AffectEnemies AffectHeroes ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              BuffNameFilter = "KennenShurikenNOCAST",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBGetBuffCountFromAll,
                Params = {
                  DestVar = "Count",
                  TargetVar = "Unit",
                  BuffName = "KennenShurikenStormHolder"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Count",
                  Value2 = 2,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "KennenShurikenNOCAST",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  }
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenMarkofStorm",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 3,
                  NumberOfStacks = 1,
                  Duration = 8,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "KennenShurikenStormMOS",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 10,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "BonusDamage",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.4,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenShurikenStormHolder",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 4,
                  NumberOfStacks = 1,
                  Duration = 5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenShurikenNOCAST",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "kennen_ss_tar.troy",
                  Flags = 0,
                  EffectIDVar = "a",
                  BoneName = "spine",
                  TargetObjectVar = "Unit",
                  TargetBoneName = "spine",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = true
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Level",
      Src1VarTable = "InstanceVars",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.4,
          TrackTimeVar = "LastTimeExecuted",
          TrackTimeVarTable = "InstanceVars",
          ExecuteImmediately = true
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetAreaRandom,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 550,
              Flags = "AffectEnemies AffectHeroes ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              BuffNameFilter = "KennenShurikenNOCAST",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBGetBuffCountFromAll,
                Params = {
                  DestVar = "Count",
                  TargetVar = "Unit",
                  BuffName = "KennenShurikenStormHolder"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Count",
                  Value2 = 2,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "KennenShurikenNOCAST",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  }
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenMarkofStorm",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 3,
                  NumberOfStacks = 1,
                  Duration = 8,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "KennenShurikenStormMOS",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 10,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "BonusDamage",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.4,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenShurikenStormHolder",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 4,
                  NumberOfStacks = 1,
                  Duration = 5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenShurikenNOCAST",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "kennen_ss_tar.troy",
                  Flags = 0,
                  EffectIDVar = "a",
                  BoneName = "spine",
                  TargetObjectVar = "Unit",
                  TargetBoneName = "spine",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = true
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Level",
      Src1VarTable = "InstanceVars",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.33,
          TrackTimeVar = "LastTimeExecuted",
          TrackTimeVarTable = "InstanceVars",
          ExecuteImmediately = true
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetAreaRandom,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 550,
              Flags = "AffectEnemies AffectHeroes ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              BuffNameFilter = "KennenShurikenNOCAST",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBGetBuffCountFromAll,
                Params = {
                  DestVar = "Count",
                  TargetVar = "Unit",
                  BuffName = "KennenShurikenStormHolder"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Count",
                  Value2 = 2,
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "KennenShurikenNOCAST",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 5,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  }
                }
              },
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenMarkofStorm",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 3,
                  NumberOfStacks = 1,
                  Duration = 8,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "KennenShurikenStormMOS",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 10,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "BonusDamage",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.4,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenShurikenStormHolder",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 4,
                  NumberOfStacks = 1,
                  Duration = 5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenShurikenNOCAST",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "kennen_ss_tar.troy",
                  Flags = 0,
                  EffectIDVar = "a",
                  BoneName = "spine",
                  TargetObjectVar = "Unit",
                  TargetBoneName = "spine",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = true
                }
              }
            }
          }
        }
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        80,
        145,
        210
      }
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
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        3,
        4,
        5
      },
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_ss_aoe_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_ss_aoe_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenshurikennocast"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenshurikenstormholder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenmarkofstorm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenshurikenstormmos"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_ss_tar.troy"
    }
  }
}
