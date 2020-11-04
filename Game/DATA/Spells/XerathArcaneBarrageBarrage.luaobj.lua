BuffTextureName = "Xerath_ArcaneBarrage.dds"
BuffName = "XerathBarrage"
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "XerathArcaneBarrageBarrage"
    }
  },
  {
    Function = BBElse,
    Params = {},
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
          DestVar = "SpellCooldown",
          SrcValueByLevel = {
            80,
            70,
            60,
            40,
            40
          }
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetPercentCooldownMod,
          TargetVar = "Owner",
          DestVar = "CooldownStat"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "CooldownStat",
          Src1Value = 1,
          Src2Value = 0,
          DestVar = "Multiplier",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "Multiplier",
          Src2Var = "SpellCooldown",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "NewCooldown",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcVar = "NewCooldown",
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 3,
          OwnerVar = "Owner"
        }
      }
    }
  }
}
