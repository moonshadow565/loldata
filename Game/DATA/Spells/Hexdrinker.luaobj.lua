BuffTextureName = "3155_Hexdrinker.dds"
BuffName = "HexdrunkEmpowered"
AutoBuffActivateEffect = "hexTech_dmg_shield_duration.troy"
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
