NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = false
BuffTextureName = "Katarina_Voracity.dds"
BuffName = "Voracity"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
PersistsThroughDeath = true
Nondispellable = true
BuffOnKillBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "katarina_spell_refresh_indicator.troy",
          Flags = 0,
          EffectIDVar = "Placeholder",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBIncGold,
        Params = {TargetVar = "Owner", Delta = 50}
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 0,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 1,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcValue = 0,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          SpellSlotValue = 2,
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBGetSlotSpellInfo,
        Params = {
          DestVar = "DLCooldown",
          SpellSlotValue = 3,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellCooldownTime
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DLCooldown",
          Src1Value = 0,
          Src2Value = 15,
          DestVar = "DLCooldown",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBSetSlotSpellCooldownTime,
        Params = {
          SrcVar = "DLCooldown",
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
BuffOnAssistBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "katarina_spell_refresh_indicator.troy",
      Flags = 0,
      EffectIDVar = "Placeholder",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBIncGold,
    Params = {TargetVar = "Owner", Delta = 50}
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 0,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 1,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 2,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "DLCooldown",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellCooldownTime
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DLCooldown",
      Src1Value = 0,
      Src2Value = 15,
      DestVar = "DLCooldown",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "DLCooldown",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 3,
      OwnerVar = "Owner"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_spell_refresh_indicator.troy"
    }
  }
}
