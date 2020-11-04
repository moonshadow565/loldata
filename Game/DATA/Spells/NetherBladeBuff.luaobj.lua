BuffTextureName = "Voidwalker_NullBlade.dds"
BuffName = "NetherBladeArmorPen"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
SpellToggleSlot = 2
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ArmorPenAmount",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        7,
        15,
        25,
        38,
        50
      }
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Kassadin_Netherblade.troy",
      Flags = 0,
      EffectIDVar = "ChargedBladeEffect",
      EffectIDVarTable = "InstanceVars",
      BoneName = "R_hand",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ChargedBladeEffect",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorPenetrationMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorPenAmount",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "kassadin_netherblade.troy"
    }
  }
}
