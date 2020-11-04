NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
SelfExecuteBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 2000,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes AffectUntargetable ",
      IteratorVar = "Unit",
      BuffNameFilter = "AlphaStrikeMarker",
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
            Function = BBGetPointByUnitFacingOffset,
            Params = {
              UnitVar = "Unit",
              Distance = 75,
              OffsetAngle = 0,
              PositionVar = "Pos"
            }
          },
          {
            Function = BBTeleportToPosition,
            Params = {OwnerVar = "Owner", CastPositionName = "Pos"}
          },
          {
            Function = BBIf,
            Params = {Src1Var = "Unit", CompareOp = CO_IS_TYPE_HERO},
            SubBlocks = {
              {
                Function = BBIssueOrder,
                Params = {
                  WhomToOrderVar = "Owner",
                  TargetOfOrderVar = "Unit",
                  Order = AI_ATTACKTO
                }
              }
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Owner",
              BuffName = "AlphaStrikeMarker",
              ResetDuration = 0
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "AlphaStrikeMarker",
              ResetDuration = 0
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
      Name = "alphastrikemarker"
    }
  }
}
