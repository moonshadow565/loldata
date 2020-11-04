NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Skarner_Q.dds"
BuffName = "SkarnerVirulentSlash"
SpellFXOverrideSkins = {
  "ReefMalphite"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unlockanimation"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_crystal_slash_mini_nova.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_crystal_slash_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerpassivebuff"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "chogath_basic_attack_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "skarner_crystal_slash_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnervirulentslashslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnervirulentslash"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnervirulentslashenergy1"
    }
  }
}
