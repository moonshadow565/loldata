NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Fiddlesticks_DarkWind.dds"
BuffName = "Silence"
AutoBuffActivateEffect = "Global_Silence.troy"
SpellDamageRatio = 1
SpellFXOverrideSkins = {
  "SurprisePartyFiddlesticks",
  "XmasKatarina"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "katarinaqinternalmark"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "katarinaqmarkspellshieldcheck"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_bouncingblades_tar_sand.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_cyber_bouncingblades_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_xmas_bouncingblades_tar.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "katarina_bouncingblades_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "katarinaqmark"
    }
  }
}
