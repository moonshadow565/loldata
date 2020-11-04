NonDispellable = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBGetBuffCountFromCaster,
        Params = {
          DestVar = "TurretBuffCount",
          TargetVar = "Owner",
          CasterVar = "Owner",
          BuffName = "TurretDamageMarker"
        }
      },
      {
        Function = BBGetBuffCountFromCaster,
        Params = {
          DestVar = "TargetBuffCount",
          TargetVar = "Target",
          CasterVar = "Owner",
          BuffName = "TurretDamageMarker"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "TurretBuffCount",
          Src2Var = "TargetBuffCount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "BuffCount",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "BuffCount",
          Src1Value = 0.2,
          Src2Value = 0,
          DestVar = "DamageBonus",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "DamageBonus",
          Src1Value = 0.9,
          Src2Value = 0,
          DestVar = "DamageBonus",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageBonus",
          Src2Var = "DamageAmount",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TurretBuffCount",
          Value2 = 3,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "TurretDamageMarker",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 3,
              NumberOfStacks = 1,
              Duration = 3,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "TurretDamageMarker",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 3,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "turretdamagemarker"
    }
  }
}
