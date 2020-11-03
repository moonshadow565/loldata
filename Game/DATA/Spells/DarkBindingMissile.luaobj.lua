NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
AutoBuffActivateEffect = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Snared"
PreLoadBuildingBlocks = {
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
