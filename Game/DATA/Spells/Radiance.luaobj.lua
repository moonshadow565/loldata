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
Nondispellable = true
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
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageIncrease",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        0.4,
        0.6,
        0.8
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "RegenIncrease",
      DestVarTable = "InstanceVars",
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
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "RegenIncrease",
      DestVarTable = "InstanceVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 850,
      Flags = "AffectFriends AffectMinions AffectHeroes NotAffectSelf ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageIncrease",
          DestVarTable = "NextBuffVars",
          SrcVar = "DamageIncrease",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageIncrease",
          Src1VarTable = "NextBuffVars",
          Src1Value = 0,
          Src2Value = 0.5,
          DestVar = "DamageIncrease",
          DestVarTable = "NextBuffVars",
          MathOp = MO_MULTIPLY
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
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "RadianceAura",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 1.1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      }
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
      Stat = IncPercentPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "DamageIncrease",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatHPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "RegenIncrease",
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
        Function = BBGetManaOrHealth,
        Params = {
          DestVar = "CurMana",
          OwnerVar = "Owner",
          Function = GetMana
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
            Function = BBIncMana,
            Params = {
              TargetVar = "Owner",
              Delta = 0,
              DeltaVar = "ManaCostNeg"
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 850,
              Flags = "AffectFriends AffectMinions AffectHeroes NotAffectSelf ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageIncrease",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "DamageIncrease",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageIncrease",
                  Src1VarTable = "NextBuffVars",
                  Src1Value = 0,
                  Src2Value = 0.5,
                  DestVar = "DamageIncrease",
                  DestVarTable = "NextBuffVars",
                  MathOp = MO_MULTIPLY
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
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "RadianceAura",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  BuffType = BUFF_Aura,
                  MaxStack = 1,
                  NumberStacks = 1,
                  Duration = 1.1,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
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
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
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
        Params = {SrcValue = 0}
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
          SrcValue = 10
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaCostInc",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            10,
            15,
            20
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "Radiance",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
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
