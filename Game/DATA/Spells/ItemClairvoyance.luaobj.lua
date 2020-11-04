NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = false
IsDamagingSpell = false
AutoBuffActivateEffect = "GuinsoosRodofOblivion_buf.troy"
PersistsThroughDeath = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "trinketorblvl2audio.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_trinket_itemclairvoyance_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_trinket_itemclairvoyance.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_trinket_itemclairvoyance_red.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemclairvoyancesight"
    }
  }
}
