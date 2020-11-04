DoesntBreakShields = true
CastingBreaksStealth = false
BuffTextureName = "ShyvanaTwinBite.dds"
BuffName = "ShyvanaDoubleAttackDragon"
AutoBuffActivateEffect = "shyvana_doubleAttack_buf.troy"
AutoBuffActivateAttachBoneName = "R_Hand"
AutoBuffActivateEffect2 = "shyvana_doubleAttack_buf.troy"
AutoBuffActivateAttachBoneName2 = "L_Hand"
IsDeathRecapSource = true
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellCooldown",
      RequiredVarTable = "InstanceVars"
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
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 3,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1,
      CancelAttack = true
    }
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = true}
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = true}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      SrcVar = "SpellCooldown",
      SrcVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "SpellCooldown",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "NewCooldown",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 0,
      OwnerVar = "Owner"
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
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = true}
  },
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = false}
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseAttackDamage"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ShyvanaDoubleAttackDragon",
      ResetDuration = 0
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
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 325,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Attacker",
          ObjectVar2 = "Unit"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Target",
          Src2Var = "Unit",
          CompareOp = CO_EQUAL
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "Distance",
              Value2 = 250,
              CompareOp = CO_LESS_THAN
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Owner",
                  Src2Var = "Unit",
                  CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
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
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "BaseAttackDamage",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_ATTACK,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "BaseAttackDamage",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_PROC,
                      PercentOfAttack = 0,
                      PercentOfAttackByLevel = {
                        0.8,
                        0.85,
                        0.9,
                        0.95,
                        1
                      },
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Target",
                      AttackerVar = "Attacker",
                      BuffName = "ShyvanaFireballMissile"
                    },
                    SubBlocks = {
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
                        Params = {
                          DestVar = "ProcDamage",
                          SrcValueByLevel = {
                            15,
                            25,
                            35,
                            45,
                            55
                          }
                        }
                      },
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Attacker",
                          CallForHelpAttackerVar = "Attacker",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "ProcDamage",
                          DamageType = MAGIC_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELL,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0.1,
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
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Owner",
                          EffectName = "shyvana_flameBreath_reignite.troy",
                          Flags = 0,
                          EffectIDVar = "a",
                          TargetObjectVar = "Owner",
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
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Target",
                      AttackerVar = "Attacker",
                      BuffName = "ShyvanaFireballMissileMinion"
                    },
                    SubBlocks = {
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
                        Params = {
                          DestVar = "ProcDamage",
                          SrcValueByLevel = {
                            15,
                            25,
                            35,
                            45,
                            55
                          }
                        }
                      },
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Attacker",
                          CallForHelpAttackerVar = "Attacker",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "ProcDamage",
                          DamageType = MAGIC_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELL,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0.1,
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
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Owner",
                          EffectName = "shyvana_flameBreath_reignite.troy",
                          Flags = 0,
                          EffectIDVar = "a",
                          TargetObjectVar = "Owner",
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
                    Function = BBIf,
                    Params = {
                      Src1Var = "Level",
                      Value2 = 1,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIncPAR,
                        Params = {
                          TargetVar = "Owner",
                          Delta = 2,
                          PARType = PAR_OTHER
                        }
                      }
                    }
                  },
                  {
                    Function = BBElseIf,
                    Params = {
                      Src1Var = "Level",
                      Value2 = 2,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIncPAR,
                        Params = {
                          TargetVar = "Owner",
                          Delta = 3,
                          PARType = PAR_OTHER
                        }
                      }
                    }
                  },
                  {
                    Function = BBElseIf,
                    Params = {
                      Src1Var = "Level",
                      Value2 = 3,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIncPAR,
                        Params = {
                          TargetVar = "Owner",
                          Delta = 4,
                          PARType = PAR_OTHER
                        }
                      }
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
                    SubBlocks = {
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Unit",
                          EffectName = "shyvana_doubleAttack_tar.troy",
                          Flags = 0,
                          EffectIDVar = "a",
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        10,
        9,
        8,
        7,
        6
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
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
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 0,
      OwnerVar = "Owner"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shyvana_flamebreath_reignite.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shyvana_doubleattack_tar.troy"
    }
  }
}
