NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "CardMaster_FatesGambit.dds"
BuffName = "Pick A Card"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "AnnieSparks.troy",
      Flags = 0,
      EffectIDVar = "Sparks",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Counter",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "WillRemove",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Counter",
      Src1VarTable = "InstanceVars",
      Value2 = 2,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "Owner",
          EffectName = "Card_Blue.troy",
          Flags = 0,
          EffectIDVar = "EffectID",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 600,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Counter",
      Src1VarTable = "InstanceVars",
      Value2 = 4,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "Owner",
          EffectName = "Card_Red.troy",
          Flags = 0,
          EffectIDVar = "EffectID",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 600,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          PosVar = "Owner",
          EffectName = "Card_Yellow.troy",
          Flags = 0,
          EffectIDVar = "EffectID",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWTeamOverrideVar = "TeamID",
          FOWVisibilityRadius = 600,
          SendIfOnScreenOrDiscard = false,
          PersistsThroughReconnect = false,
          BindFlexToOwnerPAR = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Frozen",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "removeParticle",
      DestVarTable = "InstanceVars",
      SrcValue = 1
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "PickACard",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 6
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "BaseCooldown",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "NewCooldown",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 1,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "removeParticle",
      Src1VarTable = "InstanceVars",
      Value2 = 2,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "EffectID",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GoldCardPreAttack",
      ResetDuration = 0
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RedCardPreAttack",
      ResetDuration = 0
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "BlueCardPreAttack",
      ResetDuration = 0
    }
  },
  {
    Function = BBSetAutoAcquireTargets,
    Params = {TargetVar = "Owner", Value = true}
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Frozen",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Counter",
          Src1VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "Counter",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Counter",
          Src1VarTable = "InstanceVars",
          Value2 = 2,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "Card_Red.troy",
              Flags = 0,
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 600,
              SendIfOnScreenOrDiscard = false,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBSetSpell,
            Params = {
              SlotNumber = 1,
              SlotType = SpellSlots,
              SlotBook = SPELLBOOK_CHAMPION,
              SpellName = "RedCardLock",
              TargetVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Counter",
          Src1VarTable = "InstanceVars",
          Value2 = 4,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "Card_Yellow.troy",
              Flags = 0,
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 600,
              SendIfOnScreenOrDiscard = false,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBSetSpell,
            Params = {
              SlotNumber = 1,
              SlotType = SpellSlots,
              SlotBook = SPELLBOOK_CHAMPION,
              SpellName = "GoldCardLock",
              TargetVar = "Owner"
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {
          Src1Var = "Counter",
          Src1VarTable = "InstanceVars",
          Value2 = 6,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              PosVar = "Owner",
              EffectName = "Card_Blue.troy",
              Flags = 0,
              EffectIDVar = "EffectID",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 600,
              SendIfOnScreenOrDiscard = false,
              PersistsThroughReconnect = false,
              BindFlexToOwnerPAR = false,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBSetSpell,
            Params = {
              SlotNumber = 1,
              SlotType = SpellSlots,
              SlotBook = SPELLBOOK_CHAMPION,
              SpellName = "BlueCardLock",
              TargetVar = "Owner"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Counter",
              DestVarTable = "InstanceVars",
              SrcValue = 0
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "removeParticle",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "EffectID",
          EffectIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "removeParticle",
          DestVarTable = "InstanceVars",
          SrcValue = 2
        }
      }
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "pickacardlock",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Frozen",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSealSpellSlot,
            Params = {
              SpellSlot = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              TargetVar = "Owner",
              State = true
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Frozen",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "redcardlock",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Frozen",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetBuffRemainingDuration,
            Params = {
              DestVar = "displayDuration",
              TargetVar = "Owner",
              BuffName = "PickACard"
            }
          },
          {
            Function = BBSealSpellSlot,
            Params = {
              SpellSlot = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              TargetVar = "Owner",
              State = true
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Frozen",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "RedCardPreAttack",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "displayDuration",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "removeParticle",
              DestVarTable = "InstanceVars",
              SrcValue = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Pickacard_tracker",
              ResetDuration = 0
            }
          },
          {
            Function = BBSetAutoAcquireTargets,
            Params = {TargetVar = "Owner", Value = false}
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "goldcardlock",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Frozen",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetBuffRemainingDuration,
            Params = {
              DestVar = "displayDuration",
              TargetVar = "Owner",
              BuffName = "PickACard"
            }
          },
          {
            Function = BBSealSpellSlot,
            Params = {
              SpellSlot = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              TargetVar = "Owner",
              State = true
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Frozen",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "GoldCardPreAttack",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "displayDuration",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "removeParticle",
              DestVarTable = "InstanceVars",
              SrcValue = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Pickacard_tracker",
              ResetDuration = 0
            }
          },
          {
            Function = BBSetAutoAcquireTargets,
            Params = {TargetVar = "Owner", Value = false}
          }
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "bluecardlock",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Frozen",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetBuffRemainingDuration,
            Params = {
              DestVar = "displayDuration",
              TargetVar = "Owner",
              BuffName = "PickACard"
            }
          },
          {
            Function = BBSealSpellSlot,
            Params = {
              SpellSlot = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              TargetVar = "Owner",
              State = true
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "Frozen",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "BlueCardPreAttack",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "displayDuration",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "removeParticle",
              DestVarTable = "InstanceVars",
              SrcValue = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Pickacard_tracker",
              ResetDuration = 0
            }
          },
          {
            Function = BBSetAutoAcquireTargets,
            Params = {TargetVar = "Owner", Value = false}
          }
        }
      }
    }
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Frozen",
          Src1VarTable = "InstanceVars",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSkipNextAutoAttack,
            Params = {TargetVar = "Owner"}
          },
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "Level",
              SpellSlotValue = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellLevel
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Counter",
              Src1VarTable = "InstanceVars",
              Value2 = 1,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Owner",
                  TargetVar = "Target",
                  PosVar = "Target",
                  EndPosVar = "Target",
                  OverrideCastPosition = false,
                  SlotNumber = 5,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 0,
                  OverrideForceLevelVar = "Level",
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = false,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = true,
                  UpdateAutoAttackTimer = true
                }
              }
            }
          },
          {
            Function = BBElseIf,
            Params = {
              Src1Var = "Counter",
              Src1VarTable = "InstanceVars",
              Value2 = 3,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Owner",
                  TargetVar = "Target",
                  PosVar = "Target",
                  EndPosVar = "Target",
                  OverrideCastPosition = false,
                  SlotNumber = 6,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 0,
                  OverrideForceLevelVar = "Level",
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = false,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = true,
                  UpdateAutoAttackTimer = true
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSpellCast,
                Params = {
                  CasterVar = "Owner",
                  TargetVar = "Target",
                  PosVar = "Target",
                  EndPosVar = "Target",
                  OverrideCastPosition = false,
                  SlotNumber = 1,
                  SlotType = ExtraSlots,
                  OverrideForceLevel = 0,
                  OverrideForceLevelVar = "Level",
                  OverrideCoolDownCheck = true,
                  FireWithoutCasting = false,
                  UseAutoAttackSpell = false,
                  ForceCastingOrChannelling = true,
                  UpdateAutoAttackTimer = true
                }
              }
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Rnd1",
      Value2 = 0.34,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Counter",
          DestVarTable = "NextBuffVars",
          SrcValue = 0
        }
      },
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 1,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "BlueCardLock",
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0.005,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 1,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "Rnd1",
      Value2 = 0.67,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Counter",
          DestVarTable = "NextBuffVars",
          SrcValue = 2
        }
      },
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 1,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "RedCardLock",
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0.005,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 1,
          OwnerVar = "Owner"
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
          DestVar = "Counter",
          DestVarTable = "NextBuffVars",
          SrcValue = 4
        }
      },
      {
        Function = BBSetSpell,
        Params = {
          SlotNumber = 1,
          SlotType = SpellSlots,
          SlotBook = SPELLBOOK_CHAMPION,
          SpellName = "GoldCardLock",
          TargetVar = "Owner"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0.005,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 1,
          OwnerVar = "Owner"
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "WillRemove",
      DestVarTable = "NextBuffVars",
      SrcValue = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "PickACard_tracker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
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
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "PickACard",
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "anniesparks.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "card_blue.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "card_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "card_yellow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "pickacard"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "redcardlock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "goldcardlock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bluecardlock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "redcardpreattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "goldcardpreattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "bluecardpreattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pickacard_tracker"
    }
  }
}
