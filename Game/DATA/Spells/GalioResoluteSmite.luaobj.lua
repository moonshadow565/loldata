NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Galio_ResoluteSmite.dds"
BuffName = "GalioResoluteSmite"
AutoBuffActivateEffect = "Global_Slow.troy"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_concussiveblast_mis_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_concussiveblast_unit_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_concussiveblast_unit_tar_02.troy"
    }
  }
}
