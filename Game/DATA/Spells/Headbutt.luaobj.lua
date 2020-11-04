NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Minotaur_Headbutt.dds"
BuffName = "Charging"
SpellDamageRatio = 1
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Damage",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "UnlockAnimation"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Value1 = 0,
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "HeadbuttHit"
        },
        SubBlocks = {
          {
            Function = BBSetBuffCasterUnit,
            Params = {CasterVar = "Attacker"}
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 275,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              BuffNameFilter = "AlistarHeadbuttMarker",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "AlistarHeadbuttMarker"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "HeadbuttHit",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 2,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBBreakSpellShields,
                    Params = {TargetVar = "Unit"}
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "HasDealtDamage",
                      DestVarTable = "InstanceVars",
                      SrcValue = true
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Owner",
                      CallForHelpAttackerVar = "Owner",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "Damage",
                      DamageVarTable = "InstanceVars",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELL,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 1,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBApplyAssistMarker,
                    Params = {
                      Duration = 10,
                      TargetVar = "Unit",
                      SourceVar = "Owner"
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "HeadbuttTarget",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Stun,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  },
                  {
                    Function = BBSpellBuffRemoveCurrent,
                    Params = {TargetVar = "Owner"}
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
TargetExecuteBuildingBlocks = {
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Owner", LocationVar = "Target"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        85,
        135,
        185,
        235,
        285
      }
    }
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Attacker",
      ObjectVar2 = "Target"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Distance",
      Src1Value = 0,
      Src2Value = 650,
      DestVar = "factor",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "factor",
      Src1Value = 0,
      Src2Value = 0.25,
      DestVar = "factor",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "factor",
      Src1Value = 0,
      Src2Value = 0.9,
      DestVar = "factor",
      MathOp = MO_MIN
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "UnlockAnimation",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "factor",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBPlayAnimation,
    Params = {
      AnimationName = "Spell2",
      ScaleTime = 0,
      ScaleTimeVar = "factor",
      TargetVar = "Owner",
      Loop = false,
      Blend = false,
      Lock = true
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {UnitVar = "Target", PositionVar = "targetPos"}
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Owner",
      TargetVar = "targetPos",
      Speed = 1500,
      Gravity = 2,
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = CANCEL_ORDER,
      MovementOrdersFacing = FACE_MOVEMENT_DIRECTION,
      IdealDistance = 0,
      IdealDistanceVar = "Distance"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBSpawnMinion,
    Params = {
      Name = "placeholder",
      Skin = "TestCube",
      AiScript = "idle.lua",
      PosVar = "Owner",
      Team = TEAM_UNKNOWN,
      TeamVar = "teamID",
      Stunned = false,
      Rooted = true,
      Silenced = false,
      Invulnerable = true,
      MagicImmune = false,
      IgnoreCollision = true,
      Placemarker = false,
      VisibilitySize = 0,
      DestVar = "Other1",
      GoldRedirectTargetVar = "Owner"
    }
  },
  {
    Function = BBFaceDirection,
    Params = {TargetVar = "Other1", LocationVar = "Target"}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "AlistarHeadbuttMarker",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Other1",
      AttackerVar = "Other1",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Other1",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0.25,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AlistarTrample",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = false,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "Headbutt"
    }
  }
}
BuffOnMoveSuccessBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Attacker"}
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 400,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      BuffNameFilter = "AlistarHeadbuttMarker",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "AlistarHeadbuttMarker"
        },
        SubBlocks = {
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Owner",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "Damage",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 1,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBApplyAssistMarker,
            Params = {
              Duration = 10,
              TargetVar = "Unit",
              SourceVar = "Owner"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "HeadbuttTarget",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Stun,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Headbutt"
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "headbutthit"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alistarheadbuttmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "headbutttarget"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alistartrample"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "headbutt"}
  }
}
