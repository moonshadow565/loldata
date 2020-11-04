BuffTextureName = "Heimerdinger_UPGRADE.dds"
BuffName = "UpgradeSlow"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "heimerdinger_slowAura_self.troy",
      Flags = 0,
      EffectIDVar = "FrostTurrets",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "willPop",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "H28GEvolutionTurret"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "willPop",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBPushCharacterData,
        Params = {
          SkinName = "HeimerTBlue",
          TargetVar = "Owner",
          IDVar = "RedShift",
          IDVarTable = "InstanceVars",
          OverrideSpells = true
        }
      }
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Nothing",
      BuffName = "H28GEvolutionTurretSpell1"
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Nothing",
          BuffName = "H28GEvolutionTurretSpell2"
        },
        SubBlocks = {
          {
            Function = BBForNClosestUnitsInTargetArea,
            Params = {
              AttackerVar = "Attacker",
              CenterVar = "Owner",
              Range = 425,
              Flags = "AffectEnemies AffectHeroes ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "H28GEvolutionTurretSpell3"
                }
              },
              {
                Function = BBCancelAutoAttack,
                Params = {TargetVar = "Owner", Reset = true}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Unit",
                  BuffName = "H28GEvolutionTurretSpell2",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
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
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "FrostTurrets",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "willPop",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBPopCharacterData,
        Params = {
          TargetVar = "Owner",
          IDVar = "RedShift",
          IDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Attacker",
          BuffName = "ExplosiveCartridges"
        },
        SubBlocks = {
          {
            Function = BBPushCharacterData,
            Params = {
              SkinName = "HeimerTRed",
              TargetVar = "Owner",
              IDVar = "rShift",
              OverrideSpells = true
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "UrAniumRounds"
            },
            SubBlocks = {
              {
                Function = BBPushCharacterData,
                Params = {
                  SkinName = "HeimerTGreen",
                  TargetVar = "Owner",
                  IDVar = "gShift",
                  OverrideSpells = true
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBPushCharacterData,
                Params = {
                  SkinName = "HeimerTYellow",
                  TargetVar = "Owner",
                  IDVar = "yShift",
                  OverrideSpells = true
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
      Name = "heimerdinger_slowaura_self.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturret"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "heimertblue"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturretspell1"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturretspell2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturretspell3"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "explosivecartridges"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "heimertred"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "uraniumrounds"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "heimertgreen"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "heimertyellow"
    }
  }
}
