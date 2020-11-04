NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = true
BuffTextureName = "Lulu_Whimsy.dds"
BuffName = "LuluWDebuff"
AutoBuffActivateEffect = "Global_Silence.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
SpellFXOverrideSkins = {
  "luluDarkCandy",
  "luluClassic"
}
PopupMessage1 = "game_floatingtext_Polymorphed"
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
  }
}
