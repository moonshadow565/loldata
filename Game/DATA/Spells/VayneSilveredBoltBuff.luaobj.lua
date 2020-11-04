NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Vayne_SilveredBolts.dds"
BuffName = "VayneSilverBolts"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
IsDeathRecapSource = true
PersistsThroughDeath = true
SpellFXOverrideSkins = {""}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetStatus,
    Params = {
      TargetVar = "Owner",
      DestVar = "CanMove",
      Status = GetCanMove
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "IsBlinded",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = True}
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "HitResult",
                  Value2 = HIT_Dodge,
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "HitResult",
                      Value2 = HIT_Miss,
                      CompareOp = CO_NOT_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBGetBuffCountFromCaster,
                        Params = {
                          DestVar = "Count",
                          TargetVar = "Target",
                          CasterVar = "Attacker",
                          BuffName = "VayneSilveredDebuff"
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "Count",
                          Value2 = 2,
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBGetTeamID,
                            Params = {TargetVar = "Attacker", DestVar = "TeamID"}
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Nothing",
                              PosVar = "Target",
                              EffectName = "vayne_W_tar.troy",
                              Flags = 0,
                              EffectIDVar = "gragas",
                              TargetObjectVar = "Target",
                              SpecificUnitOnlyVar = "Target",
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
                        Function = BBSpellBuffAdd,
                        Params = {
                          TargetVar = "Target",
                          AttackerVar = "Attacker",
                          BuffName = "VayneSilveredDebuff",
                          BuffAddType = BUFF_STACKS_AND_RENEWS,
                          StacksExclusive = true,
                          BuffType = BUFF_CombatDehancer,
                          MaxStack = 3,
                          NumberOfStacks = 1,
                          Duration = 3.5,
                          BuffVarsTable = "NextBuffVars",
                          TickRate = 0,
                          CanMitigateDuration = false,
                          IsHiddenOnClient = false
                        }
                      },
                      {
                        Function = BBIf,
                        Params = {
                          Src1Var = "Count",
                          Value2 = 2,
                          CompareOp = CO_EQUAL
                        },
                        SubBlocks = {
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Target",
                              Damage = 0,
                              DamageVar = "DamageAmount",
                              DamageType = PHYSICAL_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_PROC,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBSetVarInTable,
                            Params = {
                              DestVar = "DamageAmount",
                              SrcValue = 0
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
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vayne_w_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynesilvereddebuff"
    }
  }
}
