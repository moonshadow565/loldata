NotSingleTargetSpell = false
DoesntTriggerSpellCasts = true
BuffTextureName = "Heimerdinger_R.dds"
BuffName = "HeimerdingerR"
AutoBuffActivateEffect = "Heimerdinger_Base_R_Antenna_Glow.troy"
AutoBuffActivateAttachBoneName = "R_Buffbone_Cstm_Antenna"
AutoBuffActivateEffect2 = "Heimerdinger_Base_R_Antenna_Glow.troy"
AutoBuffActivateAttachBoneName2 = "L_Buffbone_Cstm_Antenna"
SpellToggleSlot = 4
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingereult"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_base_r_beam.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_base_r_antenna_glow.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "heimerdingere"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_base_r_cast.troy"
    }
  }
}
