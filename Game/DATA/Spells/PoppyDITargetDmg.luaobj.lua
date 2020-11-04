BuffTextureName = "Poppy_DiplomaticImmunity.dds"
BuffName = "PoppyDiplomaticImmunityDmg"
BuffOnPreDealDamageBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Owner",
      BuffName = "PoppyDITarget"
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
          DestVar = "LevelMultiplier",
          SrcValueByLevel = {
            1.2,
            1.3,
            1.4
          }
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DamageAmount",
          Src2Var = "LevelMultiplier",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "DamageAmount",
          MathOp = MO_MULTIPLY
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppyditarget"
    }
  }
}
