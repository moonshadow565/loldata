NonDispellable = True
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 900,
      Flags = "AffectEnemies AffectMinions AffectHeroes ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1
    },
    SubBlocks = {
      {
        Function = BBCanSeeTarget,
        Params = {
          ViewerVar = "Owner",
          TargetVar = "Unit",
          ResultVar = "CanSee"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "CanSee",
          Value2 = true,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBFaceDirection,
            Params = {TargetVar = "Owner", LocationVar = "Unit"}
          },
          {
            Function = BBSpellCast,
            Params = {
              CasterVar = "Owner",
              TargetVar = "Unit",
              PosVar = "Owner",
              EndPosVar = "Owner",
              SlotNumber = 3,
              SlotType = SpellSlots,
              OverrideForceLevel = 1,
              OverrideCoolDownCheck = false,
              FireWithoutCasting = false,
              UseAutoAttackSpell = false
            }
          }
        }
      }
    }
  }
}
