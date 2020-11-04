AutoBuffActivateEffect = ""
PersistsThroughDeath = true
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "InitialDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Damage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorReduction",
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "TargetPos",
      EffectName = "nassus_spiritFire_afterburn.troy",
      Flags = 0,
      EffectIDVar = "c",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamOfOwner",
      FOWVisibilityRadius = 200,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "TargetPos",
      EffectName = "nassus_spiritFire_tar_green.troy",
      EffectNameForOtherTeam = "nassus_spiritFire_tar_red.troy",
      Flags = 0,
      EffectIDVar = "Boom2",
      EffectIDVarTable = "InstanceVars",
      EffectID2Var = "Boom",
      EffectID2VarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Nothing",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamOfOwner",
      FOWVisibilityRadius = 200,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
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
      DestVar = "ArmorReduction",
      DestVarTable = "NextBuffVars",
      SrcVar = "ArmorReduction",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "TargetPos",
      Range = 400,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = false
    },
    SubBlocks = {
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          CallForHelpAttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "InitialDamage",
          DamageVarTable = "InstanceVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.6,
          PhysicalDamageRatio = 0,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "SpiritFireArmorReduction",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Shred,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 25000,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Count",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Boom",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Boom2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "c",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Src1VarTable = "InstanceVars",
      Value2 = 5,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBExecutePeriodically,
        Params = {
          TimeBetweenExecutions = 0.9,
          TrackTimeVar = "LastTimeExecuted",
          TrackTimeVarTable = "InstanceVars",
          ExecuteImmediately = false
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "Count",
              Src1VarTable = "InstanceVars",
              Src1Value = 0,
              Src2Value = 1,
              DestVar = "Count",
              DestVarTable = "InstanceVars",
              MathOp = MO_ADD
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
              DestVar = "ArmorReduction",
              DestVarTable = "NextBuffVars",
              SrcVar = "ArmorReduction",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Attacker",
              CenterVar = "TargetPos",
              Range = 400,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Damage",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 5,
                  DestVar = "TotalDamage",
                  MathOp = MO_DIVIDE
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Unit",
                  Damage = 0,
                  DamageVar = "TotalDamage",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_SPELLAOE,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.12,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "SpiritFireArmorReduction",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Shred,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 25000,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nassus_spiritfire_afterburn.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nassus_spiritfire_tar_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nassus_spiritfire_tar_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "spiritfirearmorreduction"
    }
  }
}
