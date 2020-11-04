BuffTextureName = "Evelynn_Stalk.dds"
BuffName = "Silent Killer"
PersistsThroughDeath = true
Nondispellable = true
BuffOnBeingHitBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "AttackerID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "AttackerID",
      Value2 = TEAM_NEUTRAL,
      CompareOp = CO_EQUAL
    }
  },
  {
    Function = BBElseIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO}
      },
      {
        Function = BBElseIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBMath,
            Params = {
              Src1Var = "DamageAmount",
              Src1Value = 0,
              Src2Value = 0.5,
              DestVar = "DamageAmount",
              MathOp = MO_MULTIPLY
            }
          }
        }
      }
    }
  }
}
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "MaliceHeal",
          DeltaVarTable = "CharVars",
          HealerVar = "Owner"
        }
      }
    }
  }
}
BuffOnAssistBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIncHealth,
        Params = {
          TargetVar = "Owner",
          Delta = 0,
          DeltaVar = "MaliceHeal",
          DeltaVarTable = "CharVars",
          HealerVar = "Owner"
        }
      }
    }
  }
}
