BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "activations",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
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
            Function = BBIf,
            Params = {
              Src1Var = "DamageAmount",
              Value2 = 10,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "DamageAmount",
                  SrcVar = "TickDamage",
                  SrcVarTable = "InstanceVars"
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "activations",
                  DestVarTable = "InstanceVars",
                  SrcValue = 0
                }
              },
              {
                Function = BBSetBuffCasterUnit,
                Params = {CasterVar = "Caster"}
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Caster",
                  BuffName = "TimeBombCountdown"
                }
              }
            }
          }
        }
      }
    }
  }
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "activations",
      DestVarTable = "InstanceVars",
      SrcValue = 1
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TickDamage",
      RequiredVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "timebombcountdown"
    }
  }
}
