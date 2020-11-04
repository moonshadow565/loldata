NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
AutoBuffActivateEffect = "Temp_Zyra_Plant_Enrage.troy"
AutoBuffActivateAttachBoneName = "Vine_5"
SpellDamageRatio = 1
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xarathornenemytexture.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "temp_zyra_plant_enrage.troy"
    }
  }
}
