NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "AkaliMota.dds"
BuffName = "AkaliMota"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
Nondispellable = true
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_markoftheassasin_marker_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_markoftheassasin_marker_tar_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "akali_mark_impact_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "akalishadowswipehealingparticle"
    }
  }
}
