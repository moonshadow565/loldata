BuffTextureName = "LeonaSunlight.dds"
BuffName = "LeonaSunlight"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Leona_Sunlight_Champion.troy",
          Flags = 0,
          EffectIDVar = "Particle1",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
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
          BindObjectVar = "Owner",
          EffectName = "Leona_Sunlight.troy",
          Flags = 0,
          EffectIDVar = "Particle1",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false,
          FollowsGroundTilt = false,
          FacesTarget = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle1",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Attacker",
      Value2 = true,
      CompareOp = CO_IS_TYPE_HERO
    },
    SubBlocks = {
      {
        Function = BBSetBuffCasterUnit,
        Params = {CasterVar = "Caster"}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Caster",
          Src2Var = "Attacker",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {
              TargetVar = "Attacker",
              DestVar = "TeamIDAttacker"
            }
          },
          {
            Function = BBGetTeamID,
            Params = {
              TargetVar = "Caster",
              DestVar = "TeamIDCaster"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "TeamIDAttacker",
              Src2Var = "TeamIDCaster",
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBGetLevel,
                Params = {TargetVar = "Caster", DestVar = "Level"}
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "SunlightDamage",
                  SrcValueByLevel = {
                    20,
                    20,
                    35,
                    35,
                    50,
                    50,
                    65,
                    65,
                    80,
                    80,
                    95,
                    95,
                    110,
                    110,
                    125,
                    125,
                    140,
                    140
                  }
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Attacker1",
                  DestVarTable = "InstanceVars",
                  SrcVar = "Attacker"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "TeamIDAttacker",
                  DestVarTable = "InstanceVars",
                  SrcVar = "TeamIDAttacker"
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Target",
                  EffectName = "LuxPassive_tar.troy",
                  Flags = 0,
                  EffectIDVar = "MotaExplosion",
                  TargetObjectVar = "Target",
                  SpecificUnitOnlyVar = "Owner",
                  SpecificTeamOnly = TEAM_UNKNOWN,
                  UseSpecificUnit = false,
                  FOWTeam = TEAM_UNKNOWN,
                  FOWTeamOverrideVar = "TeamIDAttacker",
                  FOWVisibilityRadius = 10,
                  SendIfOnScreenOrDiscard = true,
                  FollowsGroundTilt = false,
                  FacesTarget = false
                }
              },
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "LeonaSunlight"
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  CallForHelpAttackerVar = "Attacker",
                  TargetVar = "Owner",
                  Damage = 0,
                  DamageVar = "SunlightDamage",
                  DamageType = MAGIC_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_PROC,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 0,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              },
              {
                Function = BBSpellBuffRemoveCurrent,
                Params = {TargetVar = "Owner"}
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
      Name = "leona_sunlight_champion.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leona_sunlight.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxpassive_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leonasunlight"
    }
  }
}
