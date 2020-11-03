NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
SelfExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "AlphaStrikeTeleport"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "AlphaStrikeTeleport"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 2000,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "AlphaStrikeMarker"
            },
            SubBlocks = {
              {
                Function = BBGetUnitPosition,
                Params = {UnitVar = "Unit", PositionVar = "Pos"}
              },
              {
                Function = BBTeleportToPosition,
                Params = {OwnerVar = "Owner", CastPositionName = "Pos"}
              },
              {
                Function = BBSpellBuffRemove,
                Params = {
                  TargetVar = "Unit",
                  AttackerVar = "Owner",
                  BuffName = "AlphaStrikeMarker"
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
      Name = "alphastriketeleport"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "alphastrikemarker"
    }
  }
}
