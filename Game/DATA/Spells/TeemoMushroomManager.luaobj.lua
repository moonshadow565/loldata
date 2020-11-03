PersistsThroughDeath = true
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "TeemoMushroomCounter"
        },
        SubBlocks = {
          {
            Function = BBGetBuffCountFromCaster,
            Params = {
              DestVar = "Count",
              TargetVar = "Owner",
              CasterVar = "Owner",
              BuffName = "TeemoMushrooms"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Count",
              Value2 = 3,
              CompareOp = CO_NOT_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "TeemoMushroomCounter",
                  BuffAddType = BUFF_REPLACE_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 0,
                  BuffVarsTable = "NextBuffVars",
                  DurationVar = "MushroomCooldown",
                  DurationVarTable = "CharVars",
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
      Name = "teemomushroomcounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teemomushrooms"
    }
  }
}
