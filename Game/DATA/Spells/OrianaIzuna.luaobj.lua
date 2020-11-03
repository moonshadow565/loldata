NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3057_Sheen.dds"
BuffName = "Sheen"
SpellVOOverrideSkins = {"BroOlaf"}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CastPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Landed",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBGetUnitPosition,
    Params = {
      UnitVar = "Owner",
      PositionVar = "OwnerCenter"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
SpellOnMissileEndBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CorrectSpell",
      SrcValue = false
    }
  },
  {
    Function = BBGetBuffRemainingDuration,
    Params = {
      DestVar = "Duration",
      TargetVar = "Owner",
      BuffName = "OrianaIzuna"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "orianaizuna",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CorrectSpell",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "OrianaIzuna",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CorrectSpell",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {CompareOp = CO_EQUAL},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "GhostAlive",
          DestVarTable = "CharVars",
          SrcValue = false
        }
      },
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Owner",
          BuffName = "OrianaIzuna"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Landed",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Duration",
      Value2 = 0.001,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "CorrectSpell",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "TeamID"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "TargetPos",
              SrcVar = "TargetPos",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpawnMinion,
            Params = {
              Name = "TheDoomBall",
              Skin = "Oriana_Ball",
              AiScript = "idle.lua",
              PosVar = "MissileEndPosition",
              Team = TEAM_ORDER,
              TeamVar = "TeamID",
              Stunned = false,
              Rooted = true,
              Silenced = false,
              Invulnerable = true,
              MagicImmune = true,
              IgnoreCollision = true,
              Placemarker = true,
              VisibilitySize = 0,
              DestVar = "Other3",
              GoldRedirectTargetVar = "Owner"
            }
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
              BindObjectVar = "Nothing",
              PosVar = "MissileEndPosition",
              EffectName = "Oriana_Izuna_nova.troy",
              Flags = 0,
              EffectIDVar = "Temp",
              TargetObjectVar = "Nothing",
              TargetPosVar = "MissileEndPosition",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "TeamID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true,
              FollowsGroundTilt = false,
              FacesTarget = false
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Attacker",
              CenterVar = "Other3",
              Range = 175,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BaseDamage",
                  SrcValueByLevel = {
                    60,
                    100,
                    140,
                    180,
                    220
                  }
                }
              },
              {
                Function = BBGetStat,
                Params = {
                  Stat = GetFlatMagicDamageMod,
                  TargetVar = "Owner",
                  DestVar = "AP"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "AP",
                  Src1Value = 0,
                  Src2Value = 0.6,
                  DestVar = "BonusDamage",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "BonusDamage",
                  Src2Var = "BaseDamage",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "TotalDamage",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "TotalDamage",
                  Src2Var = "IzunaPercent",
                  Src2VarTable = "CharVars",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "TotalDamage",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src2Var = "IzunaPercent",
                  Src2VarTable = "CharVars",
                  Src1Value = 0.9,
                  Src2Value = 0,
                  DestVar = "IzunaPercent",
                  DestVarTable = "CharVars",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src2Var = "IzunaPercent",
                  Src2VarTable = "CharVars",
                  Src1Value = 0.4,
                  Src2Value = 0,
                  DestVar = "IzunaPercent",
                  DestVarTable = "CharVars",
                  MathOp = MO_MAX
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "TotalDamage",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "TotalDamage"
                }
              },
              {
                Function = BBIfNotHasBuff,
                Params = {
                  OwnerVar = "Unit",
                  CasterVar = "Nothing",
                  BuffName = "OrianaIzunaDamage"
                },
                SubBlocks = {
                  {
                    Function = BBBreakSpellShields,
                    Params = {TargetVar = "Unit"}
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Unit",
                      AttackerVar = "Attacker",
                      BuffName = "OrianaIzunaDamage",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBDestroyMissile,
    Params = {MissileIDVar = "MissileID", MissileIDVarTable = "CharVars"}
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Target",
      CasterVar = "Nothing",
      BuffName = "OrianaIzunaDamaged"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BaseDamage",
          SrcValueByLevel = {
            60,
            100,
            140,
            180,
            220
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatMagicDamageMod,
          TargetVar = "Owner",
          DestVar = "AP"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "AP",
          Src1Value = 0,
          Src2Value = 0.6,
          DestVar = "BonusDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "BonusDamage",
          Src2Var = "BaseDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TotalDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TotalDamage",
          Src2Var = "IzunaPercent",
          Src2VarTable = "CharVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "TotalDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "IzunaPercent",
          Src2VarTable = "CharVars",
          Src1Value = 0.9,
          Src2Value = 0,
          DestVar = "IzunaPercent",
          DestVarTable = "CharVars",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "IzunaPercent",
          Src2VarTable = "CharVars",
          Src1Value = 0.4,
          Src2Value = 0,
          DestVar = "IzunaPercent",
          DestVarTable = "CharVars",
          MathOp = MO_MAX
        }
      },
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Target"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "TotalDamage",
          DestVarTable = "NextBuffVars",
          SrcVar = "TotalDamage"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "OrianaIzunaDamage",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
BuffOnLaunchMissileBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MissileID",
      DestVarTable = "CharVars",
      SrcVar = "missileId"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "GhostAlive",
      DestVarTable = "CharVars",
      SrcValue = true
    }
  },
  {
    Function = BBGetMissilePosFromID,
    Params = {
      TargetIDVar = "missileId",
      TargetID = 0,
      ResultVar = "MissilePosition"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MissilePosition",
      DestVarTable = "InstanceVars",
      SrcVar = "MissilePosition",
      SrcValue = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaizuna"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "oriana_ball"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "oriana_izuna_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaizunadamage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaizunadamaged"
    }
  }
}
