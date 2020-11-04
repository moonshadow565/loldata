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
    Function = BBPreloadCharacter,
    Params = {
      Name = "testcuberender"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "hecarim_skn4_r.troy"
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
