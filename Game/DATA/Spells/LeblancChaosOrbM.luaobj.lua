NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "LeblancMarkOfSilenceM.dds"
BuffName = "LeblancMarkOfSilenceM"
AutoCooldownByLevel = {
  16,
  14,
  12,
  10,
  8
}
NonDispellable = true
TriggersSpellCasts = true
SetSpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displace_aoe_tar_ult.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancchaosorbm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancchaosorb"
    }
  }
}
