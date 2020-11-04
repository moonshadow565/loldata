NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "RengarUlt.dds"
BuffName = "RengarRSpeed"
AutoBuffActivateEffect = "Global_haste.troy"
SpellToggleSlot = 1
SpellFXOverrideSkins = {
  "HunterRengar"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarferocitymanagerincombat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarr_internal"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengar_vo_second_stealth.troy"
    }
  }
}
