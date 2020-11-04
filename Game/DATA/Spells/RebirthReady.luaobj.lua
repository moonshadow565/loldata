BuffTextureName = "Cryophoenix_Rebirth.dds"
BuffName = "RebirthReady"
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
            Function = BBGetLevel,
            Params = {TargetVar = "Owner", DestVar = "Level"}
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "RebirthArmorMod",
              DestVarTable = "NextBuffVars",
              SrcValueByLevel = {
                -50,
                -50,
                -50,
                -50,
                -30,
                -30,
                -30,
                -30,
                0,
                0,
                0,
                0,
                30,
                30,
                30,
                30,
                30,
                30
              }
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Rebirth",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 6,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "RebirthReady"
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
    Params = {Name = "willrevive"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "rebirth"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rebirthready"
    }
  }
}
