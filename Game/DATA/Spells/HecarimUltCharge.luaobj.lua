NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "GragasBodySlam.dds"
BuffName = "GragasBodySlam"
SpellFXOverrideSkins = {
  "HecarimArcade"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_bodyslam_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcemarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimultcharge"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "spellbook1"}
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
      Name = "hecarimskn4extravfx"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_r_impact.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hecarimultmissilegrab"
    }
  }
}
