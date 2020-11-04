NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "ShyvanaScorchedEarth.dds"
BuffName = "ShyvanaScorchedEarth"
AutoBuffActivateEffect = "shyvana_scorchedEarth_01.troy"
AutoBuffActivateEffect2 = "shyvana_scorchedEarth_speed.troy"
AutoBuffActivateAttachBoneName2 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "shyvana_scorchedearth_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shyvanaimmolationaura"
    }
  }
}
