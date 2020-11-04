BuffTextureName = "SadMummy_Tantrum.dds"
BuffName = "Tantrum Counter"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetBuffCountFromAll,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      BuffName = "TantrumCounter"
    }
  },
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
      DestVar = "HitsRequired",
      SrcValueByLevel = {
        13,
        11,
        9,
        7,
        5
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Count",
      Src2Var = "HitsRequired",
      CompareOp = CO_GREATER_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "TantrumCanCast",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Aura,
          MaxStack = 1,
          NumberStacks = 1,
          Duration = 12,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffRemoveStacks,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "TantrumCounter",
          NumStacks = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "tantrumcounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "tantrumcancast"
    }
  }
}
