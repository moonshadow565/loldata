BuffTextureName = "VolibearQ.dds"
BuffName = "VolibearQSpeed"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "SpeedMod",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VolibearQSpeedPart",
      ResetDuration = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 2000,
      Flags = "AffectEnemies AffectNeutral AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Unit",
          CompareOp = CO_IS_TARGET_IN_FRONT_OF_ME
        },
        SubBlocks = {
          {
            Function = BBCanSeeTarget,
            Params = {
              ViewerVar = "Owner",
              TargetVar = "Unit",
              ResultVar = "Visible"
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "Visible",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "Hunt", SrcValue = true}
              },
              {
                Function = BBSpellBuffAdd,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "VolibearQHunted",
                  BuffAddType = BUFF_RENEW_EXISTING,
                  StacksExclusive = true,
                  BuffType = BUFF_Internal,
                  MaxStack = 1,
                  NumberOfStacks = 1,
                  Duration = 1.5,
                  BuffVarsTable = "NextBuffVars",
                  TickRate = 0,
                  CanMitigateDuration = false,
                  IsHiddenOnClient = false
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "VolibearQHunted"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {DestVar = "Hunt", SrcValue = true}
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Hunt",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentMovementSpeedMod,
          TargetVar = "Owner",
          DeltaVar = "SpeedMod",
          DeltaVarTable = "InstanceVars",
          Delta = 0
        }
      },
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "VolibearQSpeedPart"
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "VolibearQSpeedPart",
              BuffAddType = BUFF_RENEW_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 20,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "VolibearQSpeedPart",
          ResetDuration = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearqhunted"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "volibearqspeedpart"
    }
  }
}
