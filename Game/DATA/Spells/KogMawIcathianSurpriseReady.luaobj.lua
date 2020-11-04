BuffTextureName = "KogMaw_IcathianSurprise.dds"
BuffName = "KogMawIcathianSurpriseReady"
PersistsThroughDeath = true
NonDispellable = true
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "CurHealth",
      OwnerVar = "Owner",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CurHealth",
      Src2Var = "DamageAmount",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "KogMawIcathianSurprise"
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
              AttackerVar = "Nothing",
              BuffName = "ChronoShift"
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
                  AttackerVar = "Owner",
                  BuffName = "WillRevive"
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBMath,
                    Params = {
                      Src1Var = "CurHealth",
                      Src1Value = 0,
                      Src2Value = 1,
                      DestVar = "DamageAmount",
                      MathOp = MO_SUBTRACT
                    }
                  },
                  {
                    Function = BBSpellBuffAdd,
                    Params = {
                      TargetVar = "Owner",
                      AttackerVar = "Attacker",
                      BuffName = "KogMawIcathianSurprise",
                      BuffAddType = BUFF_RENEW_EXISTING,
                      StacksExclusive = true,
                      BuffType = BUFF_CombatEnchancer,
                      MaxStack = 1,
                      NumberOfStacks = 1,
                      Duration = 4,
                      BuffVarsTable = "NextBuffVars",
                      TickRate = 0,
                      CanMitigateDuration = false
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
    Function = BBPreloadSpell,
    Params = {
      Name = "kogmawicathiansurprise"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "chronoshift"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "willrevive"}
  }
}
