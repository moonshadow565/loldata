NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Blitzcrank_StaticField.dds"
BuffName = "StaticField"
AutoBuffActivateEffect = "StaticField_ready.troy"
AutoBuffActivateAttachBoneName = "weapon"
PersistsThroughDeath = true
Nondispellable = true
BuffOnUpdateActionsBuildingBlocks = {
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
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 2.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffRemoveCurrent,
            Params = {TargetVar = "Owner"}
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetAreaRandom,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 425,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1
            },
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Owner",
                  TargetVar = "Unit",
                  DamageByLevel = {
                    100,
                    200,
                    300
                  },
                  Damage = 0,
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_PROC,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0.2
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Unit",
                  EffectName = "StaticField_tar.troy",
                  Flags = 0,
                  TargetObjectVar = "Unit",
                  SpecificUnitOnlyVar = "Unit",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWVisibilityRadius = 0,
                  SendIfOnScreenOrDiscard = false
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
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "StaticField"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "StaticField_nova.prt",
      Flags = 0,
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      DamageByLevel = {
        250,
        375,
        500
      },
      Damage = 0,
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "staticfield_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "staticfield"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "staticfield_nova.prt"
    }
  }
}
