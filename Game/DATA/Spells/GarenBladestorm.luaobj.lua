NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Garen_KeepingthePeace.dds"
BuffName = "GarenBladestorm"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
TriggersSpellCasts = true
BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Owner",
      Src2Var = "Attacker",
      CompareOp = CO_DIFFERENT_TEAM
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Type",
          Value2 = BUFF_Slow,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetStat,
            Params = {
              Stat = GetPercentHardnessMod,
              TargetVar = "Owner",
              DestVar = "HardnessPercent"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "HardnessPercent",
              Value2 = 0.5,
              CompareOp = CO_GREATER_THAN
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src1Value = 0,
                  Src2Value = 0.5,
                  DestVar = "Duration",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src2Var = "HardnessPercent",
                  Src1Value = 1,
                  Src2Value = 0,
                  DestVar = "ReversalDivisor",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "ReversalDivisor",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_DIVIDE
                }
              }
            }
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Run",
      OverrideAnim = "Spell3",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "garen_bladeStorm_cas_02.troy",
      Flags = 0,
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "garen_weapon_glow_01.troy",
      Flags = 0,
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars",
      BoneName = "BUFFBONE_GLB_WEAPON_1",
      TargetObjectVar = "Owner",
      TargetBoneName = "BUFFBONE_WEAPON_3",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetCanAttack
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpellCooldown",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "baseDamage",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "GarenBladestorm",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetCanAttack
    }
  },
  {
    Function = BBStopCurrentOverrideAnimation,
    Params = {
      AnimationName = "Spell3",
      TargetVar = "Owner",
      Blend = false
    }
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
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
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 0,
      SrcVar = "NewCooldown",
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatCritChanceMod,
          TargetVar = "Owner",
          DestVar = "CritChance"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatCritDamageMod,
          TargetVar = "Owner",
          DestVar = "CritDamage"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CritDamage",
          Src1Value = 2,
          Src2Value = 0,
          DestVar = "CritDamage",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBPlayAnimation,
        Params = {
          AnimationName = "Spell3",
          ScaleTime = 0,
          TargetVar = "Owner",
          Loop = true,
          Blend = false
        }
      },
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
        Function = BBGetTotalAttackDamage,
        Params = {
          TargetVar = "Owner",
          DestVar = "totalDamage"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetBaseAttackDamage,
          TargetVar = "Owner",
          DestVar = "baseDamage"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "totalDamage",
          Src2Var = "baseDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "bonusDamage",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "bonusDamage",
          Src1Value = 0.5,
          Src2Value = 0,
          DestVar = "RatioDamage",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RatioDamage",
          Src2Var = "CritDamage",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "PreBonusCrit",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "RatioDamage",
          Src2Var = "baseDamage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageToDealHero",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "PreBonusCrit",
          Src2Var = "baseDamage",
          Src2VarTable = "InstanceVars",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "CritHero",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "CritHero",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "CritMinion",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageToDealHero",
          Src1Value = 0,
          Src2Value = 2,
          DestVar = "DamageToDeal",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 325,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "CritChance", CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "CritHero",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      EffectName = "garen_bladestormCrit_tar.troy",
                      Flags = 0,
                      EffectIDVar = "BSCritPH",
                      TargetObjectVar = "Unit",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "DamageToDealHero",
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      EffectName = "garen_keeper0fPeace_tar_01.troy",
                      Flags = 0,
                      EffectIDVar = "SamPH",
                      TargetObjectVar = "Unit",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true
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
                Function = BBCanSeeTarget,
                Params = {
                  ViewerVar = "Owner",
                  TargetVar = "Unit",
                  ResultVar = "canSee"
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "canSee",
                  Value2 = true,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {Src1Var = "CritChance", CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
                    SubBlocks = {
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Attacker",
                          CallForHelpAttackerVar = "Attacker",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "CritMinion",
                          DamageType = PHYSICAL_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELLAOE,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0,
                          PhysicalDamageRatio = 0,
                          IgnoreDamageIncreaseMods = false,
                          IgnoreDamageCrit = false
                        }
                      },
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Unit",
                          EffectName = "garen_bladestormCrit_tar.troy",
                          Flags = 0,
                          EffectIDVar = "BSCritPH",
                          TargetObjectVar = "Unit",
                          SpecificUnitOnlyVar = "Owner",
                          SpecificTeamOnly = TEAM_UNKNOWN,
                          UseSpecificUnit = false,
                          FOWTeam = TEAM_UNKNOWN,
                          FOWTeamOverrideVar = "TeamID",
                          FOWVisibilityRadius = 10,
                          SendIfOnScreenOrDiscard = true
                        }
                      }
                    }
                  },
                  {
                    Function = BBElse,
                    Params = {},
                    SubBlocks = {
                      {
                        Function = BBApplyDamage,
                        Params = {
                          AttackerVar = "Attacker",
                          CallForHelpAttackerVar = "Attacker",
                          TargetVar = "Unit",
                          Damage = 0,
                          DamageVar = "DamageToDeal",
                          DamageType = PHYSICAL_DAMAGE,
                          SourceDamageType = DAMAGESOURCE_SPELLAOE,
                          PercentOfAttack = 1,
                          SpellDamageRatio = 0,
                          PhysicalDamageRatio = 0,
                          IgnoreDamageIncreaseMods = false,
                          IgnoreDamageCrit = false
                        }
                      },
                      {
                        Function = BBSpellEffectCreate,
                        Params = {
                          BindObjectVar = "Unit",
                          EffectName = "garen_keeper0fPeace_tar_01.troy",
                          Flags = 0,
                          EffectIDVar = "SamPH",
                          TargetObjectVar = "Target",
                          SpecificUnitOnlyVar = "Owner",
                          SpecificTeamOnly = TEAM_UNKNOWN,
                          UseSpecificUnit = false,
                          FOWTeam = TEAM_UNKNOWN,
                          FOWTeamOverrideVar = "TeamID",
                          FOWVisibilityRadius = 10,
                          SendIfOnScreenOrDiscard = true
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
                    Function = BBGetStatus,
                    Params = {
                      TargetVar = "Unit",
                      DestVar = "isStealthed",
                      Status = GetStealthed
                    }
                  },
                  {
                    Function = BBIf,
                    Params = {
                      Src1Var = "isStealthed",
                      Value2 = false,
                      CompareOp = CO_EQUAL
                    },
                    SubBlocks = {
                      {
                        Function = BBIf,
                        Params = {Src1Var = "CritChance", CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
                        SubBlocks = {
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "CritMinion",
                              DamageType = PHYSICAL_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "garen_bladestormCrit_tar.troy",
                              Flags = 0,
                              EffectIDVar = "BSCritPH",
                              TargetObjectVar = "Unit",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true
                            }
                          }
                        }
                      },
                      {
                        Function = BBElse,
                        Params = {},
                        SubBlocks = {
                          {
                            Function = BBApplyDamage,
                            Params = {
                              AttackerVar = "Attacker",
                              CallForHelpAttackerVar = "Attacker",
                              TargetVar = "Unit",
                              Damage = 0,
                              DamageVar = "DamageToDeal",
                              DamageType = PHYSICAL_DAMAGE,
                              SourceDamageType = DAMAGESOURCE_SPELLAOE,
                              PercentOfAttack = 1,
                              SpellDamageRatio = 0,
                              PhysicalDamageRatio = 0,
                              IgnoreDamageIncreaseMods = false,
                              IgnoreDamageCrit = false
                            }
                          },
                          {
                            Function = BBSpellEffectCreate,
                            Params = {
                              BindObjectVar = "Unit",
                              EffectName = "garen_keeper0fPeace_tar_01.troy",
                              Flags = 0,
                              EffectIDVar = "SamPH",
                              TargetObjectVar = "Target",
                              SpecificUnitOnlyVar = "Owner",
                              SpecificTeamOnly = TEAM_UNKNOWN,
                              UseSpecificUnit = false,
                              FOWTeam = TEAM_UNKNOWN,
                              FOWTeamOverrideVar = "TeamID",
                              FOWVisibilityRadius = 10,
                              SendIfOnScreenOrDiscard = true
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
SelfExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "baseDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        30,
        45,
        60,
        75,
        90
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        15,
        14,
        13,
        12,
        11
      }
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "GarenBladestormLeave",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBSpellBuffRemoveType,
    Params = {TargetVar = "Owner", Type = BUFF_Slow}
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "GarenBladestorm",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 3,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.5,
        0.5,
        0.5,
        0.5,
        0.5
      }
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 1,
      SlotNumber = 2,
      SlotType = SpellSlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_bladestorm_cas_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_weapon_glow_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenbladestorm"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_bladestormcrit_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "garen_keeper0fpeace_tar_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "garenbladestormleave"
    }
  }
}
