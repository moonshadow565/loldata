BuffTextureName = "3142_Youmus_Spectral_Blade.dds"
BuffName = "SpectralFury"
AutoBuffActivateEffect = "spectral_fury_activate.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "SpectralFury_wpn_new.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
AutoBuffActivateEffect3 = "spectral_fury_activate_speed.troy"
AutoBuffActivateAttachBoneName3 = "root"
AutoBuffActivateEffect4 = "SpectralFury_wpn_new.troy"
AutoBuffActivateAttachBoneName4 = "L_hand"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "judicatorrighteousfury"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "spectralfury"
    }
  }
}
