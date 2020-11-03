BuffTextureName = "22.dds"
BuffName = "BladeRogue_CheatDeath"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateAttachBoneName4 = ""
PersistsThroughDeath = true
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIfHasBuffOfType,
        Params = {TargetVar = "Target", BuffType = BUFF_Slow},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "IsCCD", SrcValue = true}
          }
        }
      },
      {
        Function = BBIfHasBuffOfType,
        Params = {TargetVar = "Target", BuffType = BUFF_Stun},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "IsCCD", SrcValue = true}
          }
        }
      },
      {
        Function = BBIfHasBuffOfType,
        Params = {TargetVar = "Target", BuffType = BUFF_Net},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "IsCCD", SrcValue = true}
          }
        }
      },
      {
        Function = BBIfHasBuffOfType,
        Params = {TargetVar = "Target", BuffType = BUFF_Suppression},
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {DestVar = "IsCCD", SrcValue = true}
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "IsCCD",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 1.1,
              DestVar = "DamageAmount",
              MathOp = MO_MULTIPLY
            }
          }
        }
      }
    }
  }
}
