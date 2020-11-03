BuffTextureName = "3155_Hexdrinker.dds"
BuffName = "HexdrunkEmpowered"
AutoBuffActivateEffect = "hexTech_dmg_shield_duration.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
OnPreDamagePriority = 2
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hexdrinkertimercd"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hextech_dmg_shield_onhit_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hextech_dmg_shield_onhit_02.troy"
    }
  }
}
