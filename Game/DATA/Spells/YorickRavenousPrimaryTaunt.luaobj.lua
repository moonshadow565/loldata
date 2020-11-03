BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_DEAD},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "NearbyChampion",
          SrcValue = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "CheckBuilding",
          SrcValue = true
        }
      },
      {
        Function = BBForNClosestUnitsInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 1050,
          Flags = "AffectEnemies AffectHeroes ",
          IteratorVar = "Unit",
          MaximumUnitsToPick = 1,
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBApplyTaunt,
            Params = {
              AttackerVar = "Unit",
              TargetVar = "Owner",
              Duration = 1.5
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "NearbyChampion",
              SrcValue = true
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "CheckBuilding",
              SrcValue = false
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "NearbyChampion",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForNClosestUnitsInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 750,
              Flags = "AffectEnemies AffectMinions ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBApplyTaunt,
                Params = {
                  AttackerVar = "Unit",
                  TargetVar = "Owner",
                  Duration = 1.5
                }
              },
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "CheckBuilding",
                  SrcValue = false
                }
              }
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CheckBuilding",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBForNClosestUnitsInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 750,
              Flags = "AffectEnemies AffectBuildings ",
              IteratorVar = "Unit",
              MaximumUnitsToPick = 1,
              InclusiveBuffFilter = true
            },
            SubBlocks = {
              {
                Function = BBApplyTaunt,
                Params = {
                  AttackerVar = "Unit",
                  TargetVar = "Owner",
                  Duration = 1.5
                }
              }
            }
          }
        }
      }
    }
  }
}
