NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
IsDamagingSpell = true
BuffTextureName = "FallenAngel_DarkBinding.dds"
BuffName = "Dark Binding"
SpellFXOverrideSkins = {"JinxSkin01"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "jinxwsight"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jinx_w_tar.troy"
    }
  }
}
