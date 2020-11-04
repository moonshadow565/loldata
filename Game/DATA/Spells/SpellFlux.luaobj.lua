NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Ryze_LightningFlux.dds"
BuffName = "Spell Flux"
SpellDamageRatio = 1
AutoCooldownByLevel = {
  150,
  120,
  90
}
ChainMissileParameters = {
  MaximumHits = {
    5,
    5,
    5,
    5,
    5
  },
  CanHitCaster = 1,
  CanHitSameTarget = 1,
  CanHitSameTargetConsecutively = 0,
  CanHitEnemies = 1,
  CanHitFriends = 0
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ResistanceMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ResistanceMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ResistanceMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
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
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ResistanceMod",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -12,
        -15,
        -18,
        -21,
        -24
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      SrcValueByLevel = {
        50,
        70,
        90,
        110,
        130
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AoEDamage",
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
    Function = BBMath,
    Params = {
      Src1Var = "Damage",
      Src2Var = "AoEDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "UltDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "SpellFlux_tar2.troy",
      Flags = 0,
      EffectIDVar = "asdf",
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
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Owner",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Shred,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 5,
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
          Damage = 0,
          DamageVar = "Damage",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.35,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "DesperatePower"
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "DesperatePower_aoe.troy",
              Flags = 0,
              EffectIDVar = "part",
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
          },
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Target",
              Range = 300,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Target",
                  Src2Var = "Unit",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      EffectName = "ManaLeach_tar.troy",
                      Flags = 0,
                      EffectIDVar = "part2",
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
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "UltDamage",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0.175,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
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
      Name = "spellflux_tar2.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "desperatepower_aoe.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "manaleach_tar.troy"
    }
  }
}
