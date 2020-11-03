NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "Summoner_BattleCry.dds"
BuffName = "SummonerBattleCry"
AutoBuffActivateEffect = "Summoner_cast.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "summoner_battlecry.troy"
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = "summoner_battlecry_oc.troy"
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
AutoBuffActivateAttachBoneName4 = ""
AutoCooldownByLevel = {
  90,
  90,
  90
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "summoner_battlecry_obd.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
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
      Name = "summonerbattlecry"
    }
  }
}
