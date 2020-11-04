NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "XerathLocusOfPower"
PopupMessage1 = "game_floatingtext_Snared"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_r_aoe_reticle_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_r_aoe_reticle_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "rmarker"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_w_tar_directhit.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_r_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_r_aoe.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "xerath_base_r_aoe_miss.troy"
    }
  }
}
