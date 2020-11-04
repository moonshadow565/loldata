BuffName = "DoubleStrike"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "RemoveType",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "RemoveType",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 0,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 1
        }
      }
    }
  },
  {
    Function = BBElseIf,
    Params = {
      Src1Var = "RemoveType",
      Src1VarTable = "InstanceVars",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 0,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 1
        }
      },
      {
        Function = BBRemoveOverrideAutoAttack,
        Params = {OwnerVar = "Owner"}
      }
    }
  }
}
