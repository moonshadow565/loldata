NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Jester_DeathWard.dds"
BuffName = "Jack In The Box"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "jackintheboxpoof.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemdisable"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "stealth"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jackintheboxdamagesensor"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "endkill"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shacoboxslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "shacoboxsnare"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jackintheboxsoftlock"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "jackintheboxinternal"
    }
  }
}
