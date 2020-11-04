NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "Rumble_Scrap Shield.dds"
BuffName = "RumbleShield"
OnPreDamagePriority = 3
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblemechvo_w"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_skin03_w_energy_shield_02.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_skin03_w_energy_shield_01.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rumble_shield_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatdelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleshieldbuff"
    }
  }
}
