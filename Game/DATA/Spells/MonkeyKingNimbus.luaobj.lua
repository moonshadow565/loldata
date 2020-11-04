NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
IsDamagingSpell = true
BuffTextureName = "AkaliShadowDance.dds"
BuffName = "AkaliShadowDance"
AutoBuffActivateEffect = ""
ChainMissileParameters = {
  MaximumHits = {
    10,
    10,
    10,
    10,
    10
  },
  CanHitCaster = 0,
  CanHitSameTarget = 0,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Owner", PositionVar = "OwnerPos"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "OwnerPos",
      EffectName = "monkeyKing_Q_cas.troy",
      Flags = 0,
      EffectIDVar = "p3",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_NEUTRAL,
      FOWVisibilityRadius = 900,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "OwnerPos",
      EffectName = "monkeyKing_Q_cas.troy",
      Flags = 0,
      EffectIDVar = "p3",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_NEUTRAL,
      FOWVisibilityRadius = 900,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetMovementSpeed,
      TargetVar = "Owner",
      DestVar = "MoveSpeed"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MoveSpeed",
      Src1Value = 0,
      Src2Value = 1050,
      DestVar = "dashSpeed",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Target"
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Distance",
      DestVarTable = "NextBuffVars",
      SrcVar = "Distance"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "dashSpeed",
      DestVarTable = "NextBuffVars",
      SrcVar = "dashSpeed"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedVar",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.2,
        0.25,
        0.3,
        0.35,
        0.4
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageVar",
      SrcValueByLevel = {
        60,
        105,
        150,
        195,
        240
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DestVar = "BonusAD"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusAD",
      Src1Value = 0,
      Src2Value = 0.8,
      DestVar = "BonusDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "BonusDamage",
      Src2Var = "DamageVar",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageVar",
      DestVarTable = "NextBuffVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Target",
      BuffName = "MonkeyKingNimbusKick",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.25,
      CanMitigateDuration = false,
      IsHiddenOnClient = true
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "MonkeyKingDecoyStealth"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "MonkeyKingDecoyStealth",
          ResetDuration = 0
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "UnitsHit", SrcValue = 0}
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 320,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 10,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "UnitsHit",
          Value2 = 2,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Unit",
              Src2Var = "Target",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetStatus,
                Params = {
                  TargetVar = "Unit",
                  DestVar = "IsStealthed",
                  Status = GetStealthed
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "IsStealthed",
                  Value2 = true,
                  CompareOp = CO_EQUAL
                },
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
                        Function = BBGetUnitPosition,
                        Params = {UnitVar = "Unit", PositionVar = "TargetPos"}
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
                        Function = BBSpawnMinion,
                        Params = {
                          Name = "MonkeyKingClone",
                          Skin = "MonkeyKingFlying",
                          AiScript = "Aggro.lua",
                          PosVar = "OwnerPos",
                          Team = TEAM_CASTER,
                          TeamVar = "TeamID",
                          Stunned = false,
                          Rooted = false,
                          Silenced = false,
                          Invulnerable = false,
                          MagicImmune = false,
                          IgnoreCollision = true,
                          IsWard = false,
                          Placemarker = false,
                          VisibilitySize = 0,
                          DestVar = "Other1",
                          GoldRedirectTargetVar = "Owner"
                        }
                      },
                      {
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Other1",
                          AttackerVar = "Unit",
                          BuffName = "MonkeyKingNimbusKickClone",
                          BuffAddType = BUFF_REPLACE_EXISTING,
                          StacksExclusive = true,
                          BuffType = BUFF_CombatEnchancer,
                          MaxStack = 1,
                          NumberOfStacks = 1,
                          Duration = 2,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0.25,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = true
                        }
                      },
                      {
                        Function = BBMath,
                        Params = {
                          Src2Var = "UnitsHit",
                          Src1Value = 1,
                          Src2Value = 0,
                          DestVar = "UnitsHit",
                          MathOp = MO_ADD
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
                    Function = BBGetUnitPosition,
                    Params = {UnitVar = "Unit", PositionVar = "TargetPos"}
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
                    Function = BBSpawnMinion,
                    Params = {
                      Name = "MonkeyKingClone",
                      Skin = "MonkeyKingFlying",
                      AiScript = "Aggro.lua",
                      PosVar = "OwnerPos",
                      Team = TEAM_CASTER,
                      TeamVar = "TeamID",
                      Stunned = false,
                      Rooted = false,
                      Silenced = false,
                      Invulnerable = false,
                      MagicImmune = false,
                      IgnoreCollision = true,
                      IsWard = false,
                      Placemarker = false,
                      VisibilitySize = 0,
                      DestVar = "Other1",
                      GoldRedirectTargetVar = "Owner"
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Other1",
                      AttackerVar = "Unit",
                      BuffName = "MonkeyKingNimbusKickClone",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 2,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0.25,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = true
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src2Var = "UnitsHit",
                      Src1Value = 1,
                      Src2Value = 0,
                      DestVar = "UnitsHit",
                      MathOp = MO_ADD
                    }
                  }
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
      Name = "monkeyking_q_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingnimbuskick"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingdecoystealth"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingclone"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "monkeykingclone"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "monkeykingflying"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "monkeykingnimbuskickclone"
    }
  }
}
