NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
BuffTextureName = ""
BuffName = ""
AutoBuffActivateEffect = ""
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Summoner_Cast.troy",
      Flags = 0,
      EffectIDVar = "CastParticle",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBDispellNegativeBuffs,
    Params = {AttackerVar = "Owner"}
  },
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "Slot", Info = GetSpellSlot}
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Slot",
      Src1Value = 0,
      Src2Value = 4,
      DestVar = "Slot",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSetSlotSpellCooldownTimeVer2,
    Params = {
      Src = 90,
      SlotNumber = 0,
      SlotNumberVar = "Slot",
      SlotType = InventorySlots,
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      BroadcastEvent = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  }
}
