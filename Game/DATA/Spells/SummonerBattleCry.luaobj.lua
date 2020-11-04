NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Summoner_BattleCry.dds"
BuffName = "SummonerBattleCry"
AutoBuffActivateEffect = "Summoner_cast.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "summoner_battlecry.troy"
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = "summoner_battlecry_oc.troy"
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
AutoBuffActivateAttachBoneName4 = ""
AutoCooldownByLevel = {
  90,
  90,
  90
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ScaleCoef",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ScaleCap",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncScaleSkinCoef,
    Params = {
      Scale = 0,
      ScaleVar = "ScaleCoef",
      ScaleVarTable = "InstanceVars",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "APMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AttackSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "AllyAttackSpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBGetBuffRemainingDuration,
    Params = {
      DestVar = "Duration",
      TargetVar = "Owner",
      BuffName = "SummonerBattleCry"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "summoner_battlecry_obd.troy",
      Flags = 0,
      EffectIDVar = "ee",
      BoneName = "root",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMagicDamageMod,
      TargetVar = "Owner",
      DeltaVar = "APMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ScaleCap",
      Src1VarTable = "InstanceVars",
      Value2 = 4,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "ScaleCoef",
          Src2VarTable = "InstanceVars",
          Src1Value = 0.04,
          Src2Value = 0,
          DestVar = "ScaleCoef",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "ScaleCap",
          Src2VarTable = "InstanceVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "ScaleCap",
          DestVarTable = "InstanceVars",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBIncScaleSkinCoef,
    Params = {
      Scale = 0,
      ScaleVar = "ScaleCoef",
      ScaleVarTable = "InstanceVars",
      OwnerVar = "Owner"
    }
  }
}
SpellUpdateTooltipBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "APMod",
      SrcValueByLevel = {
        10,
        14,
        18,
        22,
        26,
        30,
        34,
        38,
        42,
        48,
        52,
        54,
        58,
        62,
        66,
        70,
        74,
        78
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      SrcValueByLevel = {
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "offensiveMastery",
      Src1VarTable = "AvatarVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "APMod",
          Src1Value = 0,
          Src2Value = 1.1,
          DestVar = "APMod",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AttackSpeedMod",
          Src1Value = 0,
          Src2Value = 0.05,
          DestVar = "AttackSpeedMod",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "AttackSpeedMod",
      Src1Value = 0,
      Src2Value = 100,
      DestVar = "AttackSpeedMod",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "AttackSpeedMod",
      Index = 1,
      SlotNumber = 0,
      SlotNumberVar = "SpellSlot",
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_SUMMONER,
      TargetVar = "Attacker"
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "APMod",
      Index = 2,
      SlotNumber = 0,
      SlotNumberVar = "SpellSlot",
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_SUMMONER,
      TargetVar = "Attacker"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 180
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "CooldownMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BaseCooldown",
      Index = 3,
      SlotNumber = 0,
      SlotNumberVar = "SpellSlot",
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_SUMMONER,
      TargetVar = "Attacker"
    }
  }
}
AdjustCooldownBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseCooldown",
      SrcValue = 180
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SummonerCooldownBonus",
      Src1VarTable = "AvatarVars",
      Value2 = 0,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src2Var = "SummonerCooldownBonus",
          Src2VarTable = "AvatarVars",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "CooldownMultiplier",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BaseCooldown",
          Src2Var = "CooldownMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BaseCooldown",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBSetReturnValue,
    Params = {
      SrcVar = "BaseCooldown"
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ScaleCoef",
      DestVarTable = "NextBuffVars",
      SrcValue = 0.04
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ScaleCap",
      DestVarTable = "NextBuffVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Cast.troy",
      Flags = 0,
      EffectIDVar = "CastParticle",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "Level"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "APMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        10,
        14,
        18,
        22,
        26,
        30,
        34,
        38,
        42,
        48,
        52,
        54,
        58,
        62,
        66,
        70,
        74,
        78
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35,
        0.35
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "offensiveMastery",
      Src1VarTable = "AvatarVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "APMod",
          Src1VarTable = "NextBuffVars",
          Src1Value = 0,
          Src2Value = 1.1,
          DestVar = "APMod",
          DestVarTable = "NextBuffVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AttackSpeedMod",
          Src1VarTable = "NextBuffVars",
          Src1Value = 0,
          Src2Value = 0.05,
          DestVar = "AttackSpeedMod",
          DestVarTable = "NextBuffVars",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "SummonerBattleCry",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Haste,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12,
        12
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
      Name = "summoner_battlecry_obd.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerbattlecry"
    }
  }
}
