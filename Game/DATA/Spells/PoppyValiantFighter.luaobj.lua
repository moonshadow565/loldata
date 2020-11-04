BuffTextureName = "Poppy_ValiantFighter.dds"
BuffName = "PoppyValiantFighter"
PersistsThroughDeath = true
Nondispellable = true
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "DamageType",
      Value2 = TRUE_DAMAGE,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "HealthCurrent",
              OwnerVar = "Owner",
              Function = GetHealth,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBMath,
            Params = {
              Src2Var = "HealthCurrent",
              Src1Value = 0.1,
              Src2Value = 0,
              DestVar = "DamageSoftCap",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageManipulator",
              SrcVar = "DamageAmount"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "DamageManipulator",
              Src2Var = "DamageSoftCap",
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageManipulator",
                  Src2Var = "DamageSoftCap",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageManipulator",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageManipulator",
                  Src1Value = 0,
                  Src2Value = 0.5,
                  DestVar = "DamageManipulator",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageSoftCap",
                  Src2Var = "DamageManipulator",
                  Src1Value = 0,
                  Src2Value = 0,
                  DestVar = "DamageAmount",
                  MathOp = MO_ADD
                }
              }
            }
          }
        }
      }
    }
  }
}
