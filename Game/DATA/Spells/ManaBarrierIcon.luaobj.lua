BuffTextureName = "Blitzcrank_ManaBarrier.dds"
BuffName = "ManaBarrierIcon"
PersistsThroughDeath = true
NonDispellable = true
OnPreDamagePriority = 8
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurrentHealth",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "MaxHealth",
      OwnerVar = "Target",
      Function = GetMaxHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "CurrentHealth",
      Src2Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "remainingHealth",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "remainingHealth",
      Src2Var = "MaxHealth",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "percentHealthRemaining",
      MathOp = MO_DIVIDE
    }
  },
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "ManaBarrier"
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "ManaBarrierCooldown"
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "percentHealthRemaining",
              Value2 = 0.2,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src2Var = "MaxHealth",
                  Src1Value = 0.2,
                  Src2Value = 0,
                  DestVar = "twentyPercentHealth",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "CurrentHealth",
                  Src2Var = "twentyPercentHealth",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "damageToLetThrough",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src2Var = "damageToLetThrough",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "damageToBlock",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBGetPAROrHealth,
                Params = {
                  DestVar = "CurMana",
                  OwnerVar = "Owner",
                  Function = GetPAR,
                  PARType = PAR_MANA
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "CurMana",
                  Src1Value = 0,
                  Src2Value = 0.5,
                  DestVar = "ManaShield",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "ManaShield",
                  Src2Var = "damageToBlock",
                  CompareOp = CO_GREATER_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "ManaShield",
                      DestVarTable = "NextBuffVars",
                      SrcVar = "ManaShield"
                    }
                  },
                  {
                    Function = BBSetVarInTable,
                    Params = {
                      DestVar = "amountToSubtract",
                      DestVarTable = "NextBuffVars",
                      SrcVar = "damageToBlock"
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "DamageAmount",
                      Src2Var = "damageToBlock",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "DamageAmount",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "SteamGolemShield_hit.troy",
                      Flags = 0,
                      TargetObjectVar = "Owner",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
                      FollowsGroundTilt = false,
                      FacesTarget = false
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "ManaBarrier",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 10,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false,
                      IsHiddenOnClient = false
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
                      Src2Var = "ManaShield",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "DamageAmount",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Owner",
                      EffectName = "SteamGolemShield_hit.troy",
                      Flags = 0,
                      TargetObjectVar = "Owner",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 10,
                      SendIfOnScreenOrDiscard = true,
                      FollowsGroundTilt = false,
                      FacesTarget = false
                    }
                  }
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "ManaBarrierCooldown",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 60,
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
    Function = BBPreloadSpell,
    Params = {
      Name = "manabarrier"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "manabarriercooldown"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolemshield_hit.troy"
    }
  }
}
