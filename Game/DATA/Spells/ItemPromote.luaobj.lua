NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "BannerOfCommand_Promote.dds"
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
    Function = BBPreloadSpell,
    Params = {
      Name = "itempromotecd"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itempromote"
    }
  }
}
