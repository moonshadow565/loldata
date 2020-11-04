BuffTextureName = "PlantKing_AnimateEntangler.dds"
BuffName = "Crest Of Unyielding Stone"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Global_Invulnerability.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBGetGameTime,
    Params = {
      SecondsVar = "GameTimeSec"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "GameTimeSec",
      Src1Value = 0.0666,
      Src2Value = 0,
      DestVar = "BonusResist",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "GameTimeSec",
      Src1Value = 3.33E-4,
      Src2Value = 0,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusResist",
      Src1Value = 40,
      Src2Value = 0,
      DestVar = "ResistFloored",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "ResistFloored",
      Src1Value = 80,
      Src2Value = 0,
      DestVar = "ResistCapped",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusDamage",
      Src1Value = 0.2,
      Src2Value = 0,
      DestVar = "DamageFloored",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "DamageFloored",
      Src1Value = 0.4,
      Src2Value = 0,
      DestVar = "DamageCapped",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "InstanceVars",
      SrcVar = "DamageCapped"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusResist",
      DestVarTable = "InstanceVars",
      SrcVar = "ResistCapped"
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectTurrets ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentPercentPhysicalDamageMod,
          TargetVar = "Unit",
          DeltaVar = "BonusDamage",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatArmorMod,
          TargetVar = "Unit",
          DeltaVar = "BonusResist",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatSpellBlockMod,
          TargetVar = "Unit",
          DeltaVar = "BonusResist",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusDamage",
      Src2VarTable = "InstanceVars",
      Src1Value = 100,
      Src2Value = 0,
      DestVar = "TTDmg",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "TTDmg",
      Index = 1
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "BonusResist",
      ValueVarTable = "InstanceVars",
      Index = 2
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusDamage",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "BonusDamage",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "BonusResist",
      Src2VarTable = "InstanceVars",
      Src1Value = -1,
      Src2Value = 0,
      DestVar = "BonusResist",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectFriends AffectTurrets ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentPercentPhysicalDamageMod,
          TargetVar = "Unit",
          DeltaVar = "BonusDamage",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatArmorMod,
          TargetVar = "Unit",
          DeltaVar = "BonusResist",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIncPermanentStat,
        Params = {
          Stat = IncPermanentFlatSpellBlockMod,
          TargetVar = "Unit",
          DeltaVar = "BonusResist",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      }
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 120,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
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
      Name = "global_invulnerability.troy"
    }
  }
}
