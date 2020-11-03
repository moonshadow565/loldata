AutoBuffActivateEffect = "Ahri_OrbofDeception.troy"
AutoBuffActivateAttachBoneName = "root"
TargetExecuteBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Attacker",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "OrbofDeceptionIsActive",
          DestVarTable = "NextBuffVars",
          SrcVar = "OrbofDeceptionIsActive",
          SrcVarTable = "CharVars"
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "AhriOrbDamageSilence",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 2,
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
        Function = BBDestroyMissile,
        Params = {
          MissileIDVar = "MissileNetworkID"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "OrbofDeceptionIsActive",
          Src1VarTable = "CharVars",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "OrbofDeceptionIsActive",
              DestVarTable = "CharVars",
              SrcValue = 0
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
      Name = "Ahriorbdamagesilence"
    }
  }
}
