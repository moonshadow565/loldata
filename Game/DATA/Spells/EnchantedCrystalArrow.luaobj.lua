NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Bowmaster_EnchantedArrow.dds"
BuffName = "Enchanted Crystal Arrow"
AutoBuffActivateEffect = "Iceblock_buf.troy"
AutoBuffActivateEffect2 = "Stun_glb.troy"
SpellDamageRatio = 0.5
PopupMessage1 = "game_floatingtext_Stunned"
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
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
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanMove
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "IceBlock_death.troy",
      Flags = 0,
      EffectIDVar = "ajldjfio",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
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
      Status = SetCanCast
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanMove
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBDistanceBetweenObjectAndPoint,
    Params = {
      DestVar = "Distance",
      ObjectVar = "Target",
      PointVar = "CastPoint",
      PointVarTable = "CharVars"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 0.002,
      DestVar = "StunDuration",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StunDuration",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "StunDuration",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "StunDuration",
      Src1Value = 0,
      Src2Value = 4.5,
      DestVar = "StunDuration",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 400,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Unit",
          Src2Var = "Target",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              DamageByLevel = {
                300,
                500,
                700
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 1
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "StunDuration",
              TickRate = 0
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MovementSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                -0.5,
                -0.5,
                -0.5
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "AttackSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                -0.25,
                -0.25,
                -0.25
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "Chilled",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationByLevel = {
                3,
                4,
                5
              },
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
            Params = {TargetVar = "Target"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              DamageByLevel = {
                175,
                275,
                375
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.5
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "MovementSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                -0.5,
                -0.5,
                -0.5
              }
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "AttackSpeedMod",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                -0.25,
                -0.25,
                -0.25
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "Chilled",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationByLevel = {
                3,
                4,
                5
              },
              TickRate = 0
            }
          }
        }
      }
    }
  },
  {
    Function = BBDestroyMissile,
    Params = {
      MissileIDVar = "MissileNetworkID"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "iceblock_death.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "chilled"}
  }
}
