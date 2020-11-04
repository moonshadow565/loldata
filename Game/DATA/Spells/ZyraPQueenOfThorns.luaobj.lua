NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "ZyraP.dds"
BuffName = "ZyraPQueenOfThorns"
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {
  "Zyra_hellvine",
  "ZyraSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapqueenofthornsspawn"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapqueenofthornscd"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapqueenofthornssound"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_skin02_passive_ground.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "zyraseed"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "zyraseed"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapqueenofthornsseed"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyraexpirationtimer"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapassivedeathmanagerfire"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapassivedeathmanager"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrapqueenofthorns"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyraqfissure"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyragraspingroots"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "zyrabramblezone"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "zyra_skin02_passive_ground_fade.troy"
    }
  }
}
