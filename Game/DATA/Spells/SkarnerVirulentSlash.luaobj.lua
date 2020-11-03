NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "SkarnerVirulentSlash.dds"
BuffName = "SkarnerVirulentSlash"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
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
