NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "GemKnight_Radiance.dds"
BuffName = "Radiance"
AutoBuffActivateEffect = "Radiance_glow.troy"
AutoBuffActivateAttachBoneName = "weapon"
AutoBuffActivateEffect2 = "Radiance_cas2.troy"
AutoBuffActivateAttachBoneName2 = "spine"
SpellToggleSlot = 4
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaCostInc",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaCost",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamageIncrease",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "RegenIncrease",
      RequiredVarTable = "InstanceVars"
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
          EffectName = "Radiance_red_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Radiance_Green_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
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
          EffectName = "Radiance_red_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Radiance_green_cas.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageIncrease",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "DamageIncrease",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageIncrease",
      DestVarTable = "NextBuffVars",
      SrcVar = "DamageIncrease"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RegenIncrease",
      DestVarTable = "NextBuffVars",
      SrcVar = "RegenIncrease",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBForEachUnitInTargetAreaAddBuff,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 850,
      Flags = "AffectFriends AffectMinions AffectHeroes NotAffectSelf ",
      BuffAttackerVar = "Attacker",
      BuffName = "RadianceAura",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Aura,
      BuffMaxStack = 1,
      BuffNumberOfStacks = 1,
      BuffDuration = 1.1,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      InclusiveBuffFilter = true
    }
  },
  {
    Function = BBIncHealth,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "RegenIncrease",
      DeltaVarTable = "InstanceVars",
      HealerVar = "Attacker"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
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
      Src2Var = "Multiplier",
      Src1Value = 20,
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
      SpellSlotValue = 3,
      OwnerVar = "Owner"
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
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 1,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Owner",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "RegenIncrease",
              DeltaVarTable = "InstanceVars",
              HealerVar = "Attacker"
            }
          }
        }
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurMana",
          OwnerVar = "Owner",
          Function = GetPAR,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "ManaCost",
          Src1VarTable = "InstanceVars",
          Src2Var = "ManaCostInc",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "ManaCost",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "ManaCost",
          Src1VarTable = "InstanceVars",
          Src2Var = "CurMana",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "ManaCost",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = -1,
              DestVar = "ManaCostNeg",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              PARType = PAR_MANA,
              DeltaVar = "ManaCostNeg"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageIncrease",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 0.5,
              DestVar = "DamageIncrease",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageIncrease",
              DestVarTable = "NextBuffVars",
              SrcVar = "DamageIncrease"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "RegenIncrease",
              DestVarTable = "NextBuffVars",
              SrcVar = "RegenIncrease",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBForEachUnitInTargetAreaAddBuff,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 850,
              Flags = "AffectFriends AffectMinions AffectHeroes NotAffectSelf ",
              BuffAttackerVar = "Attacker",
              BuffName = "RadianceAura",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Aura,
              BuffMaxStack = 1,
              BuffNumberOfStacks = 1,
              BuffDuration = 1.1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              InclusiveBuffFilter = true
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Radiance"
            }
          }
        }
      }
    }
  }
}
AdjustCooldownBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Radiance"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = 0.75}
      }
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Radiance"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Radiance"
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
          DestVar = "ManaCost",
          DestVarTable = "NextBuffVars",
          SrcValue = 20
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaCostInc",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            4,
            7,
            10
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageIncrease",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            30,
            60,
            90
          }
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "RegenIncrease",
          SrcValueByLevel = {
            30,
            40,
            50
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "APMod"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "APMod",
          Src1Value = 0,
          Src2Value = 0.2,
          DestVar = "APMod",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "APMod",
          Src2Var = "RegenIncrease",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "RegenIncrease",
          DestVarTable = "NextBuffVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "Radiance",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "radiance_red_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "radiance_green_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "radianceaura"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "radiance"}
  }
}
