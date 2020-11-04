BuffTextureName = "Maokai_SapMagicReady.dds"
BuffName = "MaokaiSapMagicMelee"
AutoBuffActivateEffect = "maokai_passive_indicator_left_eye.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_CSTM_SHIELDEYE_L"
AutoBuffActivateEffect2 = "maokai_passive_indicator_right_eye.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_CSTM_SHIELDEYE_R"
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
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "healthPercent",
              OwnerVar = "Owner",
              Function = GetHealthPercent,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "healthPercent",
              Value2 = 1,
              CompareOp = CO_LESS_THAN
            },
            SubBlocks = {
              {
                Function = BBGetTeamID,
                Params = {TargetVar = "Owner", DestVar = "TeamID"}
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "maxHealth",
                  OwnerVar = "Attacker",
                  Function = GetMaxHealth,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBGetLevel,
                Params = {TargetVar = "Owner", DestVar = "Level"}
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "RegenPercent",
                  SrcValue = 0.07
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "maxHealth",
                  Src2Var = "RegenPercent",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "HealthToInc",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBIncHealth,
                Params = {
                  TargetVar = "Owner",
                  Delta = 0,
                  DeltaVar = "HealthToInc",
                  HealerVar = "Owner"
                }
              },
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "Maokai_Heal.troy",
                  Flags = 0,
                  EffectIDVar = "ar",
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
                Function = BBSpellBuffClear,
                Params = {
                  TargetVar = "Owner",
                  BuffName = "MaokaiSapMagicMelee"
                }
              }
            }
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack",
      OverrideAnim = "Passive",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Attack2",
      OverrideAnim = "Passive",
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBOverrideAnimation,
    Params = {
      ToOverrideAnim = "Crit",
      OverrideAnim = "Passive",
      OwnerVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
  },
  {
    Function = BBClearOverrideAnimation,
    Params = {ToOverrideAnim = "Crit", OwnerVar = "Owner"}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "maokai_heal.troy"
    }
  }
}
