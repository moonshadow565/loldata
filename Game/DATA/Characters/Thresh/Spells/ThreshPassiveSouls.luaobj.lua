DoesntTriggerSpellCasts = true
BuffTextureName = "Thresh_Passive.dds"
BuffName = "ThreshPassiveSouls"
IsDeathRecapSource = true
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshpassivesoulsgain"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshcritattack"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshbasicattack1sfast"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshbasicattack1l"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshbasicattack1m"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshbasicattack1s"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thresh_e_warn_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "thresh_e_warn_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshecastbuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "threshrcastsound.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "testcube"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshrpentasound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshrpenta"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "threshqpassive"
    }
  }
}
