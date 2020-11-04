BuffTextureName = "Sejuani_W.dds"
BuffName = "SejuaniNorthernWindsEnrage"
AutoBuffActivateAttachBoneName = "Buffbone_Glb_Weapon_1"
SpellToggleSlot = 2
IsDeathRecapSource = true
SpellFXOverrideSkins = {
  "SejuaniSkin04"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_w_buf.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sejuani_w_buf_02.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sejuaninorthernwinds"
    }
  }
}
