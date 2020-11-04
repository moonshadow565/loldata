NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "LeblancMarkOfSilence.dds"
BuffName = "LeblancMarkOfSilence"
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
      Name = "leblanc_displace_aoe_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancchaosorb"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancchaosorbm"
    }
  }
}
