NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
CastingBreaksStealth = true
BuffTextureName = "3153_Blade_of_the_Ruined_King.dds"
BuffName = "SwordOfFeastAndFamine"
PopupMessage1 = "game_floatingtext_Slowed"
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_slow.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_haste.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemswordoffeastandfaminetransfuse"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "piratecutlass_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "globaldrain"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemswordoffeastandfamine"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "itemswordoffeastandfamineself"
    }
  }
}
