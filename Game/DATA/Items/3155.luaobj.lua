ItemOnPreDamageBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "Hexdrinker"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "DamageType",
          Value2 = MAGIC_DAMAGE,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "DamageAmount",
              Value2 = 0,
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "DamageAmount",
                  Src1Value = 0,
                  Src2Value = 0.041667,
                  DestVar = "StatBoost",
                  MathOp = MO_MULTIPLY
                }
              },
              {
                Function = BBMath,
                Params = {
                  Src1Var = "StatBoost",
                  Src1Value = 0,
                  Src2Value = 25,
                  DestVar = "StatBoost",
                  MathOp = MO_MIN
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "StatBoost",
                  DestVarTable = "NextBuffVars",
                  SrcVar = "StatBoost"
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "Hexdrinker",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatEnchancer,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 8,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "hexdrinker"}
  }
}
