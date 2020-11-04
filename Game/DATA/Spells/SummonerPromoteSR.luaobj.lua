NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "Summoner_PromoteSR.dds"
BuffName = "SummonerPromoteSR"
AutoBuffActivateEffect = "bloodboil_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "bloodboil_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_flash.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_cast.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gemknightbasicattack_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "summonerpromotesr"
    }
  }
}
