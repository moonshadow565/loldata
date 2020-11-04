NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
PopupMessage1 = "game_floatingtext_Snared"
SpellFXOverrideSkins = {
  "GhostBrideMorgana"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "morgana_skin06_q_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "morgana_blackthorn_darkbinding_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "darkbinding_tar.troy"
    }
  }
}
