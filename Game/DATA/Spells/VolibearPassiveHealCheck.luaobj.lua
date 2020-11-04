BuffTextureName = "Blitzcrank_ManaBarrier.dds"
BuffName = ""
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
      BuffName = "VolibearPassiveCD"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "percentHealthRemaining",
          Value2 = 0.3,
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "Duration", SrcValue = 6}
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VolibearPassiveHeal"
            },
            SubBlocks = {
              {
                Function = BBGetBuffRemainingDuration,
                Params = {
                  DestVar = "RemainingDuration",
                  TargetVar = "Owner",
                  BuffName = "VolibearPassiveHeal"
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Duration",
                  Src2Var = "RemainingDuration",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "Duration",
                  MathOp = MO_ADD
                }
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VolibearPassiveHeal",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0,
              BuffVarsTable = "NextBuffVars",
              DurationVar = "Duration",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VolibearPassiveCD",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 120,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VolibearPassiveHealCheck",
              ResetDuration = 0
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
      Name = "volibearpassiveheal"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearpassivecd"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "steamgolemshield_hit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "manabarrier"
    }
  }
}
