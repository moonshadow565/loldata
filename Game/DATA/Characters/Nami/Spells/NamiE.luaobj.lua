NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "NamiE.dds"
BuffName = "NamiEtt"
AutoBuffActivateEffect = "Nami_Base_E_buf.troy"
AutoBuffActivateAttachBoneName = "L_Buffbone_Glb_Hand_Loc"
AutoBuffActivateEffect2 = "Nami_Base_E_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_Buffbone_Glb_Hand_Loc"
IsDeathRecapSource = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Nami_Base_E_counter_03.troy"
    }
  },
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
      Name = "Nami_Skin01_E_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Nami_Base_E_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Nami_Base_E_counter_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "Nami_Base_E_counter_01.troy"
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
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nami_e_mis_ally.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  }
}
