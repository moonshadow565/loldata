OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "Last", SrcValue = true}
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Volibear_R_tar.troy",
      Flags = 0,
      EffectIDVar = "c",
      BoneName = "C_BUFFBONE_GLB_CENTER_LOC",
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
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "BounceCounter",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "VolibearRRatio",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "VolibearRDamage",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ChampionPriority",
      SrcValue = 0
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "VolibearRDamage",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "VolibearRDamage",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "VolibearRRatio",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "VolibearRRatio",
      DestVarTable = "InstanceVars",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Owner",
      Range = 500,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBMath,
        Params = {
          Src1Var = "ChampionPriority",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "ChampionPriority",
          MathOp = MO_ADD
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ChampionPriority",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "BounceCounter",
          Src1VarTable = "InstanceVars",
          Value2 = 3,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachVisibleUnitInTargetAreaRandom,
            Params = {
              AttackerVar = "Attacker",
              CenterVar = "Owner",
              Range = 500,
              Flags = "AffectEnemies AffectHeroes ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              BuffNameFilter = "VolibearRChain",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "volibear_R_chain_lighting_01.troy",
                  Flags = 0,
                  EffectIDVar = "ParticleID",
                  EffectIDVarTable = "InstanceVars",
                  BoneName = "head",
                  TargetObjectVar = "Unit",
                  TargetBoneName = "root",
                  SpecificUnitOnlyVar = "Unit",
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
                Function = BBMath,
                Params = {
                  Src1Var = "BounceCounter",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "BounceCounter",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BounceCounter",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "BounceCounter",
                  SrcVarTable = "InstanceVars",
                  SrcValue = 0
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "VolibearRDamage",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "VolibearRDamage",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "VolibearRRatio",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "VolibearRRatio",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "ChampionPriority",
                  Src1Value = 0,
                  Src2Value = 999,
                  DestVar = "ChampionPriority",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBGetTeamID,
                Params = {TargetVar = "Unit", DestVar = "UnitTeamID"}
              },
              {
                Function = BBAddUnitPerceptionBubble,
                Params = {
                  TeamVar = "UnitTeamID",
                  Radius = 10,
                  TargetVar = "Owner",
                  Duration = 0.75,
                  SpecificUnitsClientOnlyVar = "Nothing",
                  RevealSpecificUnitOnlyVar = "Owner",
                  RevealSteath = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "VolibearRChain",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.25,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "Last", SrcValue = false}
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "ChampionPriority",
      Value2 = 4,
      CompareOp = CO_LESS_THAN
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "BounceCounter",
          Src1VarTable = "InstanceVars",
          Value2 = 3,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForEachVisibleUnitInTargetAreaRandom,
            Params = {
              AttackerVar = "Attacker",
              CenterVar = "Owner",
              Range = 500,
              Flags = "AffectEnemies AffectNeutral AffectMinions ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              BuffNameFilter = "VolibearRChain",
              InclusiveBuffFilter = false
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "volibear_R_chain_lighting_01.troy",
                  Flags = 0,
                  EffectIDVar = "ParticleID",
                  EffectIDVarTable = "InstanceVars",
                  BoneName = "head",
                  TargetObjectVar = "Unit",
                  TargetBoneName = "root",
                  SpecificUnitOnlyVar = "Unit",
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
                Function = BBMath,
                Params = {
                  Src1Var = "BounceCounter",
                  Src1VarTable = "InstanceVars",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "BounceCounter",
                  DestVarTable = "InstanceVars",
                  MathOp = MO_ADD
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "BounceCounter",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "BounceCounter",
                  SrcVarTable = "InstanceVars",
                  SrcValue = 0
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "VolibearRDamage",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "VolibearRDamage",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "VolibearRRatio",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "VolibearRRatio",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBGetTeamID,
                Params = {TargetVar = "Unit", DestVar = "UnitTeamID"}
              },
              {
                Function = BBAddUnitPerceptionBubble,
                Params = {
                  TeamVar = "UnitTeamID",
                  Radius = 10,
                  TargetVar = "Owner",
                  Duration = 0.75,
                  SpecificUnitsClientOnlyVar = "Nothing",
                  RevealSpecificUnitOnlyVar = "Owner",
                  RevealSteath = false
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Attacker",
                  BuffName = "VolibearRChain",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0.25,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "Last", SrcValue = false}
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Last",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Owner", DestVar = "TeamID"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "Volibear_R_lasthit_sound.troy",
          Flags = 0,
          EffectIDVar = "TargetParticle",
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
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "OwnerTeamID"
    }
  },
  {
    Function = BBAddUnitPerceptionBubble,
    Params = {
      TeamVar = "OwnerTeamID",
      Radius = 250,
      TargetVar = "Attacker",
      Duration = 0.75,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSpecificUnitOnlyVar = "Nothing",
      RevealSteath = false
    }
  },
  {
    Function = BBBreakSpellShields,
    Params = {TargetVar = "Owner"}
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      CallForHelpAttackerVar = "Attacker",
      TargetVar = "Owner",
      Damage = 0,
      DamageVar = "VolibearRDamage",
      DamageVarTable = "InstanceVars",
      DamageType = MAGIC_DAMAGE,
      SourceDamageType = DAMAGESOURCE_SPELLAOE,
      PercentOfAttack = 1,
      SpellDamageRatio = 0,
      SpellDamageRatioVar = "VolibearRRatio",
      SpellDamageRatioVarTable = "InstanceVars",
      PhysicalDamageRatio = 0,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_chain_lighting_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearrchain"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_lasthit_sound.troy"
    }
  }
}
