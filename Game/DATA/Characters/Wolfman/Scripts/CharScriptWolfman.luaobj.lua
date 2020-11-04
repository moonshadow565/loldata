BuffTextureName = "Wolfman_InnerHunger.dds"
SetVarsByLevelBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "LifeStealAmount",
      DestVarTable = "CharVars",
      SrcValueByLevel = {
        5,
        5,
        5,
        5,
        5,
        5,
        10,
        10,
        10,
        10,
        10,
        10,
        15,
        15,
        15,
        15,
        15,
        15
      }
    }
  }
}
CharOnHitUnitBuildingBlocks = {
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
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Target",
                      AttackerVar = "Attacker",
                      BuffName = "EternalThirst",
                      BuffAddType = BUFF_STACKS_AND_RENEWS,
                      StacksExclusive = true,
                      BuffType = BUFF_Internal,
                      MaxStack = 4,
                      NumberOfStacks = 1,
                      Duration = 3.1,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
                    }
                  },
                  {
                    Function = BBGetBuffCountFromAll,
                    Params = {
                      DestVar = "Count",
                      TargetVar = "Target",
                      BuffName = "EternalThirst"
                    }
                  },
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "LifeStealAmount",
                      Src1VarTable = "CharVars",
                      Src2Var = "Count",
                      Src1Value = 0,
                      Src2Value = 0,
                      DestVar = "LifeStealToHeal",
                      MathOp = MO_MULTIPLY
                    }
                  },
                  {
                    Function = BBIncHealth,
                    Params = {
                      TargetVar = "Owner",
                      Delta = 0,
                      DeltaVar = "LifeStealToHeal",
                      HealerVar = "Owner"
                    }
                  },
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Attacker",
                      EffectName = "EternalThirst_buf.troy",
                      Flags = 0,
                      EffectIDVar = "num",
                      TargetObjectVar = "Target",
                      SpecificUnitOnlyVar = "Owner",
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
  }
}
CharOnActivateBuildingBlocks = {
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Owner",
      BuffName = "EternalThirstIcon",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "APBonusDamageToTowers",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ChampionChampionDelta",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
CharOnDisconnectBuildingBlocks = {
  {
    Function = BBSpellCast,
    Params = {
      CasterVar = "Owner",
      TargetVar = "Owner",
      PosVar = "Owner",
      EndPosVar = "Owner",
      OverrideCastPosition = false,
      SlotNumber = 6,
      SlotType = InventorySlots,
      OverrideForceLevel = 1,
      OverrideCoolDownCheck = true,
      FireWithoutCasting = false,
      UseAutoAttackSpell = false,
      ForceCastingOrChannelling = false,
      UpdateAutoAttackTimer = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "eternalthirst"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eternalthirst_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "eternalthirsticon"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "apbonusdamagetotowers"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "championchampiondelta"
    }
  }
}
