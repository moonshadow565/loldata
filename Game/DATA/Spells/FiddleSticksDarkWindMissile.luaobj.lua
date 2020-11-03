NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
SpellDamageRatio = 1
PersistsThroughDeath = true
SpellFXOverrideSkins = {
  "SurprisePartyFiddlesticks"
}
TargetExecuteBuildingBlocks = {
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
    Function = BBSetVarInTable,
    Params = {DestVar = "DoOnce", SrcValue = false}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "BaseDamage",
      SrcValueByLevel = {
        65,
        85,
        105,
        125,
        145
      }
    }
  },
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "FiddleSticksDarkWindMissile"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Value2 = 3,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetAreaRandom,
        Params = {
          AttackerVar = "Attacker",
          CenterVar = "Target",
          Range = 600,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 10,
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DoOnce",
              Value2 = false,
              CompareOp = CO_EQUAL
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
                      Value2 = false,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBGetUnitPosition,
                        Params = {
                          UnitVar = "Owner",
                          PositionVar = "AttackerPos"
                        }
                      },
                      {
                        Function = BBGetSlotSpellInfo,
                        Params = {
                          DestVar = "Level",
                          SpellSlotValue = 2,
                          SpellbookType = SPELLBOOK_CHAMPION,
                          SlotType = SpellSlots,
                          OwnerVar = "Attacker",
                          Function = GetSlotSpellLevel
                        }
                      },
                      {
                        Function = BBSetVarInTable,
                        Params = {DestVar = "DoOnce", SrcValue = true}
                      },
                      {
                        Function = BBSpellCast,
                        Params = {
                          CasterVar = "Attacker",
                          TargetVar = "Unit",
                          OverrideCastPosition = true,
                          OverrideCastPosVar = "Target",
                          SlotNumber = 1,
                          SlotType = ExtraSlots,
                          OverrideForceLevel = 0,
                          OverrideForceLevelVar = "Level",
                          OverrideCoolDownCheck = true,
                          FireWithoutCasting = true,
                          UseAutoAttackSpell = false,
                          ForceCastingOrChannelling = false,
                          UpdateAutoAttackTimer = false
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
                          ViewerVar = "Attacker",
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
                            Params = {
                              UnitVar = "Owner",
                              PositionVar = "AttackerPos"
                            }
                          },
                          {
                            Function = BBGetSlotSpellInfo,
                            Params = {
                              DestVar = "Level",
                              SpellSlotValue = 2,
                              SpellbookType = SPELLBOOK_CHAMPION,
                              SlotType = SpellSlots,
                              OwnerVar = "Attacker",
                              Function = GetSlotSpellLevel
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {DestVar = "DoOnce", SrcValue = true}
                          },
                          {
                            Function = BBSpellCast,
                            Params = {
                              CasterVar = "Attacker",
                              TargetVar = "Unit",
                              OverrideCastPosition = true,
                              OverrideCastPosVar = "Target",
                              SlotNumber = 1,
                              SlotType = ExtraSlots,
                              OverrideForceLevel = 0,
                              OverrideForceLevelVar = "Level",
                              OverrideCoolDownCheck = true,
                              FireWithoutCasting = true,
                              UseAutoAttackSpell = false,
                              ForceCastingOrChannelling = false,
                              UpdateAutoAttackTimer = false
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
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "FiddleSticksDarkWindMissile",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 4,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "DarkWind",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Silence,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.2,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        0,
        0,
        0,
        0,
        0
      },
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0.45,
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBGetSkinID,
    Params = {
      UnitVar = "Attacker",
      SkinIDVar = "FiddlesticksSkinID"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "FiddlesticksSkinID",
      Value2 = 6,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "Party_DarkWind_tar.troy",
          Flags = 0,
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
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
          BindObjectVar = "Target",
          EffectName = "DarkWind_tar.troy",
          Flags = 0,
          EffectIDVar = "a",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "fiddlesticksdarkwindmissile"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "darkwind"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "party_darkwind_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darkwind_tar.troy"
    }
  }
}
