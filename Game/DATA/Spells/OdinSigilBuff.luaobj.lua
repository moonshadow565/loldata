BuffTextureName = "48thSlave_WaveOfLoathing.dds"
BuffName = "OdinRedBuff"
AutoBuffActivateEffect = ""
NonDispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncScaleSkinCoef,
    Params = {Scale = 0.25, OwnerVar = "Owner"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "NeutralMonster_buf_red_offense.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
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
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncScaleSkinCoef,
    Params = {Scale = 0.25, OwnerVar = "Owner"}
  }
}
BuffOnPreDealDamageBuildingBlocks = {
  {
    Function = BBGetUnitSkinName,
    Params = {TargetVar = "Target", DestVar = "TargetName"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TargetName",
      Value2 = "OdinChaosGuardian",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "TargetName",
          Value2 = "OdinOrderGuardian",
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "TargetName",
              Value2 = "OdinNeutralGuardian",
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "TargetName",
                  Value2 = "OdinShrineBomb",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src1Value = 0,
                      Src2Value = 1.4,
                      DestVar = "DamageAmount",
                      MathOp = MO_MULTIPLY
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
      Name = "neutralmonster_buf_red_offense.troy"
    }
  }
}
