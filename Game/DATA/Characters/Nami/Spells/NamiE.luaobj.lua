NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "NamiE.dds"
BuffName = "NamiEtt"
AutoBuffActivateEffect = "Nami_E_buf.troy"
AutoBuffActivateAttachBoneName = "L_Buffbone_Glb_Hand_Loc"
AutoBuffActivateEffect2 = "Nami_E_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_Buffbone_Glb_Hand_Loc"
AutoBuffActivateEffect3 = "Nami_E_cas.troy"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "namie"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "namipassivedebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_e_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "namieslow"}
  }
}
