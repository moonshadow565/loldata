NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "XinZhao_CrescentSweep.dds"
BuffName = "XenZhaoParry"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
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
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MRByLevel",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "MRByLevel",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "xenZiou_SelfShield_01_magic.troy",
      Flags = 0,
      EffectIDVar = "MRShield",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "MRShield",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "TotalMR",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DtD",
      SrcValueByLevel = {
        125,
        225,
        325
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PercentByLevel",
      SrcValueByLevel = {
        0.15,
        0.15,
        0.15
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      PosVar = "CastPos",
      EffectName = "xenZiou_ult_cas.troy",
      Flags = 0,
      EffectIDVar = "p3",
      BoneName = "BUFFBONE_CSTM_WEAPON_1",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_NEUTRAL,
      FOWVisibilityRadius = 900,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DtD",
      Src2Var = "WeaponDmgBonus",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DtDReal",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Count",
      DestVarTable = "NextBuffVars",
      SrcValue = 0
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 500,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "CurrentHP",
          OwnerVar = "Unit",
          Function = GetHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "CurrentHP",
          Src2Var = "PercentByLevel",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "PercentDmg",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DtD",
          Src2Var = "PercentDmg",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DtDReal",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBGetStatus,
        Params = {
          TargetVar = "Unit",
          DestVar = "IsStealthed",
          Status = GetStealthed
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "xenZiou_utl_tar_02.troy",
          Flags = 0,
          EffectIDVar = "bye",
          TargetObjectVar = "Unit",
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "xenZiou_utl_tar.troy",
          Flags = 0,
          EffectIDVar = "gda",
          TargetObjectVar = "Unit",
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
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "xenZiou_utl_tar_03.troy",
          Flags = 0,
          EffectIDVar = "asdf",
          TargetObjectVar = "Unit",
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
        Function = BBIf,
        Params = {
          Src1Var = "Unit",
          Value2 = true,
          CompareOp = CO_IS_NOT_HERO
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DtDReal",
              Value2 = 600,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "DtDReal", SrcValue = 600}
              }
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "Count",
              Src2VarTable = "NextBuffVars",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "Count",
              DestVarTable = "NextBuffVars",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsStealthed",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DtDReal",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElseIf,
        Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "DtDReal",
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Unit",
              ResultVar = "CanSee"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CanSee",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "DtDReal",
                  DamageType = PHYSICAL_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_PROC,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MRByLevel",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        25,
        25,
        25,
        60,
        70
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorAmount",
      SrcValueByLevel = {
        25,
        25,
        25,
        60,
        70
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ScalingArmor",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        7,
        10,
        13
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ScalingMR",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        7,
        10,
        13
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src1VarTable = "NextBuffVars",
      Src2Var = "ScalingMR",
      Src2VarTable = "NextBuffVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CountMR",
      DestVarTable = "NextBuffVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CountMR",
      Src1VarTable = "NextBuffVars",
      Src2Var = "MRByLevel",
      Src2VarTable = "NextBuffVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalMR",
      DestVarTable = "NextBuffVars",
      MathOp = MO_ADD
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
      Duration = 6,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src1VarTable = "NextBuffVars",
      Src2Var = "ScalingArmor",
      Src2VarTable = "NextBuffVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "CountArmor",
      DestVarTable = "NextBuffVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CountArmor",
      Src1VarTable = "NextBuffVars",
      Src2Var = "ArmorAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "TotalArmor",
      DestVarTable = "NextBuffVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "XenZhaoSweepArmor",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 6,
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
      Name = "xenziou_selfshield_01_magic.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_ult_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_utl_tar_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_utl_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xenziou_utl_tar_03.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "xenzhaosweeparmor"
    }
  }
}
