BuffTextureName = "VolibearR.dds"
BuffName = "VolibearRApplicator"
AutoBuffActivateEffect = "volibear_R_attack_buf_left.troy"
AutoBuffActivateAttachBoneName = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect2 = "volibear_R_attack_buf_right.troy"
AutoBuffActivateAttachBoneName2 = "R_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect3 = "Volibear_R_cas.troy"
AutoBuffActivateEffect4 = "Volibear_R_cas_02.troy"
AutoBuffActivateAttachBoneName4 = "C_BUFFBONE_GLB_CENTER_LOC"
BuffOnAllowAddBuildingBlocks = {}
OnBuffActivateBuildingBlocks = {
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
    Function = BBRequireVar,
    Params = {
      RequiredVar = "VolibearRSpeed",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "volibear_R_cas_03.troy",
      Flags = 0,
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Volibear_R_cas_04.troy",
      Flags = 0,
      EffectIDVar = "c",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
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
      BindObjectVar = "Owner",
      EffectName = "volibear_R_lightning_arms.troy",
      Flags = 0,
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars",
      BoneName = "r_middle_finger",
      TargetObjectVar = "Target",
      TargetBoneName = "r_uparm",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
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
      BindObjectVar = "Owner",
      EffectName = "volibear_R_lightning_arms.troy",
      Flags = 0,
      EffectIDVar = "d",
      EffectIDVarTable = "InstanceVars",
      BoneName = "l_middle_finger",
      TargetObjectVar = "Target",
      TargetBoneName = "l_uparm",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "VolibearRSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncScaleSkinCoef,
    Params = {Scale = 0.08, OwnerVar = "Owner"}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "a",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "b",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "c",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "d",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "VolibearRSpeed",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "VolibearRSpeed",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncScaleSkinCoef,
    Params = {Scale = 0.08, OwnerVar = "Owner"}
  }
}
BuffOnTakeDamageBuildingBlocks = {}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "TeamID"}
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "HitResult",
              Value2 = HIT_Dodge,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "HitResult",
                  Value2 = HIT_Miss,
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSetBuffCasterUnit,
                    Params = {CasterVar = "Caster"}
                  },
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_HERO},
                    SubBlocks = {
                      {
                        Function = BBGetPetOwner,
                        Params = {PetVar = "Attacker", DestVar = "Caster"}
                      }
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Attacker",
                      EffectName = "volibear_R_chain_lighting_01.troy",
                      Flags = 0,
                      EffectIDVar = "ParticleID",
                      EffectIDVarTable = "InstanceVars",
                      BoneName = "head",
                      TargetObjectVar = "Target",
                      TargetBoneName = "root",
                      SpecificUnitOnlyVar = "Target",
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
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Target",
                      EffectName = "Volibear_R_tar.troy",
                      Flags = 0,
                      EffectIDVar = "Kennenss",
                      BoneName = "C_BUFFBONE_GLB_CENTER_LOC",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Attacker",
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
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Target",
                      EffectName = "Volibear_R_tar_02.troy",
                      Flags = 0,
                      EffectIDVar = "Kennenss",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Attacker",
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
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "Volibear_R_cas_04.troy",
                      Flags = 0,
                      EffectIDVar = "c",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 0,
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
                      DestVar = "BounceCounter",
                      DestVarTable = "NextBuffVars",
                      SrcValue = 1
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
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
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
      Name = "volibear_r_cas_03.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_cas_04.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_lightning_arms.troy"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearrlimit"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "volibear_r_tar_02.troy"
    }
  }
}
