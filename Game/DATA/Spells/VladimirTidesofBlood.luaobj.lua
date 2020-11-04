NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "Vladimir_TidesofBlood.dds"
SpellFXOverrideSkins = {
  "BloodkingVladimir",
  "VladimirSkin06"
}
SpellVOOverrideSkins = {
  "BloodkingVladimir"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "vladimir_base_e_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirtidesofbloodcost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vladimirtidesofbloodnuke"
    }
  }
}
