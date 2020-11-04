BuffTextureName = "3022_Frozen_Heart.dds"
BuffName = "Frozen Mallet Slow"
AutoBuffActivateEffect = "GLOBAL_FREEZE.TROY"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Internal_50Slow"
    },
    SubBlocks = {
      {
        Function = BBIncStat,
        Params = {
          Stat = IncPercentMultiplicativeMovementSpeedMod,
          TargetVar = "Owner",
          Delta = -0.5
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "Internal_40Slow"
        },
        SubBlocks = {
          {
            Function = BBIncStat,
            Params = {
              Stat = IncPercentMultiplicativeMovementSpeedMod,
              TargetVar = "Owner",
              Delta = -0.4
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "Internal_35Slow"
            },
            SubBlocks = {
              {
                Function = BBIncStat,
                Params = {
                  Stat = IncPercentMultiplicativeMovementSpeedMod,
                  TargetVar = "Owner",
                  Delta = -0.35
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBIfHasBuff,
                Params = {
                  OwnerVar = "Owner",
                  AttackerVar = "Owner",
                  BuffName = "Internal_30Slow"
                },
                SubBlocks = {
                  {
                    Function = BBIncStat,
                    Params = {
                      Stat = IncPercentMultiplicativeMovementSpeedMod,
                      TargetVar = "Owner",
                      Delta = -0.3
                    }
                  }
                }
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBIfHasBuff,
                    Params = {
                      OwnerVar = "Owner",
                      AttackerVar = "Owner",
                      BuffName = "Internal_15Slow"
                    },
                    SubBlocks = {
                      {
                        Function = BBIncStat,
                        Params = {
                          Stat = IncPercentMultiplicativeMovementSpeedMod,
                          TargetVar = "Owner",
                          Delta = -0.15
                        }
                      }
                    }
                  }
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
      Name = "internal_50slow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_40slow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_35slow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_30slow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "internal_15slow"
    }
  }
}
