ItemOnBeingHitBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "RanduinsOmen"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Value1 = 0.2, CompareOp = CO_RANDOM_CHANCE_LESS_THAN},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_TURRET}
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "MoveSpeedMod",
                  DestVarTable = "NextBuffVars",
                  SrcValue = -0.35
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Attacker",
                  AttackerVar = "Owner",
                  BuffName = "Slow",
                  BuffAddType = BUFF_STACKS_AND_OVERLAPS,
                  StacksExclusive = true,
                  BuffType = BUFF_Slow,
                  MaxStack = 100,
                  NumberOfStacks = 1,
                  Duration = 3,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "AttackSpeedMod",
                  DestVarTable = "NextBuffVars",
                  SrcValue = -0.35
                }
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Attacker",
                  AttackerVar = "Owner",
                  BuffName = "Cripple",
                  BuffAddType = BUFF_STACKS_AND_OVERLAPS,
                  StacksExclusive = true,
                  BuffType = BUFF_CombatDehancer,
                  MaxStack = 100,
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "randuinsomen"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "cripple"}
  }
}
