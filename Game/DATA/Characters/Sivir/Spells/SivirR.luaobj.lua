NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Sivir_R.dds"
BuffName = "On The Hunt"
AutoBuffActivateEffect = "Sivir_base_R_buf.troy"
AutoBuffActivateAttachBoneName = "C_Buffbone_Glb_Layout_Loc"
AutoCooldownByLevel = {
  90,
  90,
  90
}
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sivir_base_r_boost.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sivirraurabuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "sivirr"}
  }
}
