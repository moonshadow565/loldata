BuffTextureName = "Kennen_ElectricalSurge.dds"
BuffName = "KennenDoubleStrikeCounter"
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src2Var = "Count",
      Src2VarTable = "CharVars",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Count",
      DestVarTable = "CharVars",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Src1VarTable = "CharVars",
      Value2 = 5,
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Src1VarTable = "CharVars",
          Value2 = 4,
          CompareOp = CO_GREATER_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "KennenDoubleStrikeProc",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSpellBuffRemoveStacks,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "KennenDoubleStrikeIndicator",
              NumStacks = 0
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "KennenDoubleStrikeIndicator",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 8,
              NumberOfStacks = 1,
              Duration = 25000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
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
      Name = "kennendoublestrikeproc"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kennendoublestrikeindicator"
    }
  }
}
