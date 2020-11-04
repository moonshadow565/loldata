AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      PosVar = "Owner",
      EffectName = "kennen_ss_aoe.troy",
      Flags = 0,
      EffectIDVar = "forcefield",
      EffectIDVarTable = "InstanceVars",
      BoneName = "spine",
      TargetObjectVar = "Owner",
      TargetPosVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "forcefield",
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
        Function = BBForEachUnitInTargetAreaRandom,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 550,
          Flags = "AffectEnemies AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          BuffNameFilter = "KennenShurikenNOCAST",
          InclusiveBuffFilter = false
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromAll,
            Params = {
              DestVar = "Count",
              TargetVar = "Unit",
              BuffName = "KennenShurikenStormHolder"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 2,
              CompareOp = CO_GREATER_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenShurikenNOCAST",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBIfNotHasBuff,
            Params = {
              OwnerVar = "Unit",
              CasterVar = "Owner",
              BuffName = "KennenShurikenStormMOS"
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "KennenMarkofStorm",
                  BuffAddType = BUFF_STACKS_AND_RENEWS,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 3,
                  NumberOfStacks = 1,
                  Duration = 12,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0
                }
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "KennenShurikenStormMOS",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 10,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "BonusDamage",
              DamageVarTable = "InstanceVars",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.3,
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
              BuffName = "KennenShurikenStormHolder",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 4,
              NumberOfStacks = 1,
              Duration = 5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              EffectName = "kennen_ss_tar.troy",
              Flags = 0,
              EffectIDVar = "a",
              BoneName = "spine",
              TargetObjectVar = "Unit",
              TargetBoneName = "spine",
              SpecificUnitOnlyVar = "Unit",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = true
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
      DestVar = "BonusDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        70,
        130,
        190
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_ss_aoe.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenshurikennocast"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenshurikenstormholder"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennenmarkofstorm"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kennen_ss_tar.troy"
    }
  }
}
