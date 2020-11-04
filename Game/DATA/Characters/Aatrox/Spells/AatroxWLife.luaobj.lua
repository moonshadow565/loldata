NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Aatrox_W2.dds"
BuffName = "AatroxWLife"
PersistsThroughDeath = true
NonDispellable = true
SpellFXOverrideSkins = {
  "AatroxSkin02"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwparticler"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwparticle"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwonhlifebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "aatroxwonhlife"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "aatrox_w_life_self.troy"
    }
  }
}
