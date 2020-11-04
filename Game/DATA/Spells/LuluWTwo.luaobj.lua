NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
BuffTextureName = "Lulu_Whimsy.dds"
BuffName = "LuluWDebuff"
AutoBuffActivateEffect = "LOC_Silence.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
PopupMessage1 = "game_floatingtext_Polymorphed"
SpellFXOverrideSkins = {
  "luluDarkCandy",
  "luluClassic",
  "luluSkin04"
}
TriggersSpellCasts = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "lulucupcake"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "lulukitty"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "luludragon"}
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "lulusnowman"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {Name = "lulusquill"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "lulu_w_polymorph_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "disarm"}
  }
}
