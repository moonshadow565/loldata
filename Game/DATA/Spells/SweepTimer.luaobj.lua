NonDispellable = True
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {DestVar = "UnitFound", SrcValue = false}
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 200,
      Flags = "AffectMinions AffectHeroes NotAffectSelf ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {DestVar = "UnitFound", SrcValue = true}
      },
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Owner",
          PosVar = "Owner",
          EndPosVar = "Owner",
          SlotNumber = 0,
          SlotType = SpellSlots,
          OverrideForceLevel = 1,
          OverrideCoolDownCheck = false,
          FireWithoutCasting = false,
          UseAutoAttackSpell = false
        }
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "UnitFound",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellCast,
        Params = {
          CasterVar = "Owner",
          TargetVar = "Owner",
          PosVar = "Owner",
          EndPosVar = "Owner",
          SlotNumber = 2,
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
