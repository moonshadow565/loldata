NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = false
BuffTextureName = "RengarUlt.dds"
BuffName = "RengarRBuff"
SpellToggleSlot = 1
SpellFXOverrideSkins = {
  "HunterRengar"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengar_base_r_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarrtrackskin1"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarrtrackskin"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rengarrtrack"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "rengar_vo_seen.troy"
    }
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
      Name = "rengarr_internal"
    }
  }
}
