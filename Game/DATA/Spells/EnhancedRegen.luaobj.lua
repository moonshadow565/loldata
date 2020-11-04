BuffTextureName = "Sivir_SpellBlock.dds"
BuffName = "Spell Shield Regen"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaRegenBonus",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMPRegenMod,
      TargetVar = "Owner",
      DeltaVar = "ManaRegenBonus",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnLevelUpSpellBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Slot",
      Value2 = 2,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "Level",
          SpellSlotValue = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "ManaRegenBonus",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            0.4,
            0.8,
            1.2,
            1.6,
            2
          }
        }
      }
    }
  }
}
