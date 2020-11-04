NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Cardmaster_RapidToss.dds"
BuffName = "CardMasterStackInternal"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "CooldownBonus",
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
      RequiredVar = "AttackSpeedBonus",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "AttackSpeedBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      DeltaVar = "CooldownBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src2Var = "Count",
              Src2VarTable = "CharVars",
              Src1Value = 1,
              Src2Value = 0,
              DestVar = "Count",
              DestVarTable = "CharVars",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Src1VarTable = "CharVars",
              Value2 = 4,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "CardmasterStackParticle"
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffRemove,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "CardmasterStackParticle"
                    }
                  }
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Count",
                  DestVarTable = "CharVars",
                  SrcValue = 0
                }
              },
              {
                Function = BBSpellBuffRemoveStacks,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "CardMasterStackHolder",
                  NumStacks = 0
                }
              },
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
                SubBlocks = {
                  {
                    Function = BBGetTeamID,
                    Params = {TargetVar = "Owner", DestVar = "TeamID"}
                  },
                  {
                    Function = BBBreakSpellShields,
                    Params = {TargetVar = "Target"}
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      TargetVar = "Target",
                      Damage = 0,
                      DamageVar = "BonusDamage",
                      DamageVarTable = "InstanceVars",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELL,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0.4,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Target",
                      EffectName = "CardmasterStackAttack_tar.troy",
                      Flags = 0,
                      EffectIDVar = "c",
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
                Function = BBIf,
                Params = {
                  Src1Var = "Count",
                  Src1VarTable = "CharVars",
                  Value2 = 3,
                  CompareOp = CO_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "CardmasterStackParticle",
                      BuffAddType = BUFF_REPLACE_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 25000,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "CardMasterStackHolder",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 4,
                  NumberOfStacks = 1,
                  Duration = 25000,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
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
    Function = BBPreloadSpell,
    Params = {
      Name = "cardmasterstackparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "cardmasterstackholder"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "cardmasterstackattack_tar.troy"
    }
  }
}
