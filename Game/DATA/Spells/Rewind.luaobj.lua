NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
AutoCooldownByLevel = {
  38,
  34,
  30,
  26,
  22
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "SpellCD1",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Target",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellCD1",
      Src1Value = 0,
      Src2Value = -10,
      DestVar = "SpellCD1a",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellCD1a",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SpellCD1b",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "SpellCD1b",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 0,
      OwnerVar = "Target"
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "ChronoRefresh_tar.troy",
      Flags = 0,
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "SpellCD2",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Target",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellCD2",
      Src1Value = 0,
      Src2Value = -10,
      DestVar = "SpellCD2a",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellCD2a",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SpellCD2b",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "SpellCD2b",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 1,
      OwnerVar = "Target"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "SpellCD3",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Target",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellCD3",
      Src1Value = 0,
      Src2Value = -10,
      DestVar = "SpellCD3a",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellCD3a",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SpellCD3b",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "SpellCD3b",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 2,
      OwnerVar = "Target"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "SpellCD4",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Target",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellCD4",
      Src1Value = 0,
      Src2Value = -10,
      DestVar = "SpellCD4a",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "SpellCD4a",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "SpellCD4b",
      MathOp = MO_MAX
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "SpellCD4b",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 3,
      OwnerVar = "Target"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "chronorefresh_tar.troy"
    }
  }
}
