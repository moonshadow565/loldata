NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
SpellUpdateTooltipBuildingBlocks = {
  {
    Function = BBGetLevel,
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 30,
      DestVar = "BonusMana",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusMana",
      Src1Value = 0,
      Src2Value = 160,
      DestVar = "TotalMana",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "utilityMastery",
      Src1VarTable = "AvatarVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalMana",
          Src1Value = 0,
          Src2Value = 1.2,
          DestVar = "TotalMana",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalMana",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "SecondaryMana",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSpellToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TotalMana",
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
      ValueVar = "SecondaryMana",
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
          Src2Var = "CooldownMultiplier",
          Src1Value = 180,
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
SelfExecuteBuildingBlocks = {
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
    Params = {TargetVar = "Owner", DestVar = "OwnerLevel"}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "OwnerLevel",
      Src1Value = 0,
      Src2Value = 30,
      DestVar = "BonusMana",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusMana",
      Src1Value = 0,
      Src2Value = 160,
      DestVar = "TotalMana",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "utilityMastery",
      Src1VarTable = "AvatarVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalMana",
          Src1Value = 0,
          Src2Value = 1.2,
          DestVar = "TotalMana",
          MathOp = MO_MULTIPLY
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "TotalMana",
      Src1Value = 0,
      Src2Value = 0.5,
      DestVar = "SecondaryMana",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 600,
      Flags = "AffectFriends AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "Summoner_Mana.troy",
          Flags = 0,
          EffectIDVar = "CastParticle",
          TargetObjectVar = "Unit",
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
        Function = BBIf,
        Params = {
          Src1Var = "Unit",
          Src2Var = "Owner",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Unit",
              Delta = 0,
              PARType = PAR_MANA,
              DeltaVar = "TotalMana"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIncPAR,
            Params = {
              TargetVar = "Unit",
              Delta = 0,
              PARType = PAR_MANA,
              DeltaVar = "SecondaryMana"
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
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_mana.troy"
    }
  }
}
