BuffTextureName = "GragasBodySlam.dds"
BuffName = "GragasBodySlam"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "gragas_bodySlam_cas.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Pos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MinimumDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Run",
      OverrideAnim = "Spell1",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DashSpeed",
      SrcValueByLevel = {
        600,
        650,
        700,
        750,
        800
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Pos",
      SrcVar = "Pos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Target",
      TargetVar = "Pos",
      Speed = 0,
      SpeedVar = "DashSpeed",
      Gravity = 0,
      MoveBackBy = 0,
      MovementType = FIRST_COLLISION_HIT,
      MovementOrdersType = POSTPONE_CURRENT_ORDER,
      IdealDistance = 0,
      IdealDistanceVar = "DashSpeed"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 175,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "GragasBodySlamHolder"
        }
      },
      {
        Function = BBStopMoveBlock,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 550,
      OffsetAngle = 0,
      PositionVar = "Pos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Pos",
      DestVarTable = "NextBuffVars",
      SrcVar = "Pos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BonusDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        80,
        120,
        160,
        200,
        240
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MinimumDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        50,
        75,
        100,
        125,
        150
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "GragasBodySlam",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "gragas_bodySlam_cas_02.troy",
      Flags = 0,
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "GragasBodySlamHolder",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "gragas_bodySlam_cas_03.troy",
      Flags = 0,
      EffectIDVar = "hi",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "GragasBodySlamHolder"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "NumUnits", SrcValue = 0}
      },
      {
        Function = BBGetTotalAttackDamage,
        Params = {
          TargetVar = "Owner",
          DestVar = "AttackDamage"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AttackDamage",
          Src1Value = 0,
          Src2Value = 0.66,
          DestVar = "AttackDamageMod",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AttackDamageMod",
          Src2Var = "BonusDamage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TotalDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Attacker",
          Range = 250,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "NumUnits",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "NumUnits",
              MathOp = MO_ADD
            }
          }
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Attacker",
          Range = 250,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit"
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "TotalDamage",
              Src2Var = "NumUnits",
              Src1Value = 0,
              Src2Value = 0,
              DestVar = "DamageToDeal",
              MathOp = MO_DIVIDE
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "MinimumDamage",
              Src1VarTable = "InstanceVars",
              Src2Var = "DamageToDeal",
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "MinimumDamage",
                  DamageVarTable = "InstanceVars",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
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
                  BuffName = "GragasBodySlamTargetSlow",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBBreakSpellShields,
                Params = {TargetVar = "Unit"}
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "DamageToDeal",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELL,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
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
                  BuffName = "GragasBodySlamTargetSlow",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 2.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
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
      Name = "gragas_bodyslam_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbodyslamholder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbodyslam"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_bodyslam_cas_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_bodyslam_cas_03.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbodyslamtargetslow"
    }
  }
}
