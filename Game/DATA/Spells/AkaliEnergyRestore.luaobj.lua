NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Summoner_haste.dds"
BuffName = "AkaliShroudOfDarknessEnergyRestore"
AutoBuffActivateEffect = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "EnergyRestore",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_ENERGY,
      DeltaVar = "EnergyRestore",
      DeltaVarTable = "InstanceVars"
    }
  }
}
BuffOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 3,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "EnergyRestore",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            2,
            5,
            8
          }
        }
      }
    }
  }
}
