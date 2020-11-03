CharOnPreDamageBuildingBlocks = {
  {
    Function = BBGetPAROrHealth,
    Params = {
      DestVar = "curHealth",
      OwnerVar = "Target",
      Function = GetHealth,
      PARType = PAR_MANA
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageAmount",
      Src2Var = "curHealth",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DAMAGESOURCE_RAW",
              CompareOp = CO_DAMAGE_SOURCETYPE_IS_NOT
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "curHealth",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "DamageAmount",
                  MathOp = MO_SUBTRACT
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
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TurretDamageManager",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25000,
      BuffVarsTable = "NextBuffVars",
      TickRate = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretdamagemanager"
    }
  }
}
