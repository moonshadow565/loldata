NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "UrgotPositionReverser.dds"
BuffName = "UrgotSwapExecute"
AutoBuffActivateEffect = ""
AutoCooldownByLevel = {
  100,
  85,
  70,
  55,
  40
}
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
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Fear,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "IsDisabled",
              DestVarTable = "InstanceVars",
              SrcValue = 1
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "IsDisabled",
              DestVarTable = "InstanceVars",
              SrcValue = 1
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "IsDisabled",
              DestVarTable = "InstanceVars",
              SrcValue = 1
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "IsDisabled",
              DestVarTable = "InstanceVars",
              SrcValue = 1
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
            Function = BBSetVarInTable,
            Params = {
              DestVar = "IsDisabled",
              DestVarTable = "InstanceVars",
              SrcValue = 1
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Silence,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "IsDisabled",
              DestVarTable = "InstanceVars",
              SrcValue = 1
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
      RequiredVar = "GateParticle",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "GateParticle2",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "IsDisabled",
      DestVarTable = "InstanceVars",
      SrcValue = 0
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
          EffectName = "UrgotSwapDrip.troy",
          Flags = 0,
          EffectIDVar = "Particle3",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 200,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "UrgotSwapDrip.troy",
          Flags = 0,
          EffectIDVar = "Particle4",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 200,
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
          EffectName = "UrgotSwapDrip.troy",
          Flags = 0,
          EffectIDVar = "Particle3",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 200,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "UrgotSwapDrip.troy",
          Flags = 0,
          EffectIDVar = "Particle4",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 200,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "teleUp",
      ScaleTime = 1.2,
      TargetVar = "Owner",
      Loop = false,
      Blend = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
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
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "GateParticle2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "GateParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle3",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle4",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "UrgotSwapMissile"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "Suppression"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "UrgotSwapTarget"
    }
  },
  {
    Function = BBUnlockAnimation,
    Params = {OwnerVar = "Owner", Blend = false}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsDisabled",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Owner",
          ObjectVar2 = "Attacker"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Value2 = 3000,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Owner",
              BuffName = "UrgotSwapExecute",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "UnlockAnimation",
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
          },
          {
            Function = BBPlayAnimation,
            Params = {
              AnimationName = "teleDwn",
              ScaleTime = 0.7,
              TargetVar = "Owner",
              Loop = false,
              Blend = false
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Attacker",
      CasterVar = "Owner",
      BuffName = "UrgotSwapTarget"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "IsDisabled",
          DestVarTable = "InstanceVars",
          SrcValue = 1
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {TargetVar = "Owner", BuffName = "UrgotSwap2"}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsDisabled",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {TargetVar = "Owner", BuffName = "UrgotSwap2"}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "TargetPos"}
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
              BindObjectVar = "Target",
              EffectName = "UrgotSwapTarget.troy",
              Flags = 0,
              EffectIDVar = "GateParticle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = true,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 200,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "UrgotSwapTarget.troy",
              Flags = 0,
              EffectIDVar = "GateParticle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              TargetBoneName = "root",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = true,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 200,
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
              BindObjectVar = "Target",
              EffectName = "UrgotSwapTarget.troy",
              Flags = 0,
              EffectIDVar = "GateParticle",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_ORDER,
              UseSpecificUnit = true,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 200,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "UrgotSwapTarget.troy",
              Flags = 0,
              EffectIDVar = "GateParticle2",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Nothing",
              SpecificTeamOnly = TEAM_CHAOS,
              UseSpecificUnit = true,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 200,
              SendIfOnScreenOrDiscard = false
            }
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "GateParticle",
          DestVarTable = "NextBuffVars",
          SrcVar = "GateParticle",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "GateParticle2",
          DestVarTable = "NextBuffVars",
          SrcVar = "GateParticle2",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TargetPos",
          DestVarTable = "NextBuffVars",
          SrcVar = "TargetPos"
        }
      },
      {
        Function = BBFaceDirection,
        Params = {TargetVar = "Owner", LocationVar = "TargetPos"}
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "UrgotSwapMarker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "UrgotSwapMarker",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Target",
          BuffName = "UrgotSwapMissile",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Attacker",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DefInc",
          SrcValueByLevel = {
            80,
            105,
            130
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DefInc",
          DestVarTable = "NextBuffVars",
          SrcVar = "DefInc"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "UrgotSwapDef",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Target"}
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "Suppression",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Suppression,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Owner",
          BuffName = "UrgotSwapTarget",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Target",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetSlotSpellCooldownTimeVer2,
        Params = {
          Src = 5,
          SlotNumber = 3,
          SlotType = SpellSlots,
          SpellbookType = SPELLBOOK_CHAMPION,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "ManaRefund", SrcValue = 120}
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          PARType = PAR_MANA,
          DeltaVar = "ManaRefund"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotswapdrip.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "suppression"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswaptarget"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapexecute"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "urgotswap2"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "urgotswaptarget.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "urgotswapdef"
    }
  }
}
