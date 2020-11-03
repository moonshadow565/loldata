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
            Function = BBIf,
            Params = {
              Src1Var = "MiniCritChance",
              Src1VarTable = "CharVars",
              CompareOp = CO_RANDOM_CHANCE_LESS_THAN
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_HERO},
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src1Value = 0,
                      Src2Value = 10,
                      DestVar = "DamageAmount",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBGetTeamID,
                    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Target",
                      EffectName = "akali_mark_impact_tar.troy",
                      Flags = 0,
                      EffectIDVar = "MotaExplosion",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Target",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true
                    }
                  },
                  {
                    Function = BBSay,
                    Params = {
                      OwnerVar = "Target",
                      ToSay = "Mini Crit: ",
                      SrcVar = "DamageAmount"
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src1Value = 0,
                      Src2Value = 10,
                      DestVar = "DamageAmount",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBGetTeamID,
                    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Target",
                      EffectName = "akali_mark_impact_tar.troy",
                      Flags = 0,
                      EffectIDVar = "MotaExplosion",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Target",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWTeamOverrideVar = "TeamID",
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true
                    }
                  },
                  {
                    Function = BBSay,
                    Params = {
                      OwnerVar = "Target",
                      ToSay = "Mini Crit: ",
                      SrcVar = "DamageAmount"
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
      Name = "akali_mark_impact_tar.troy"
    }
  }
}
