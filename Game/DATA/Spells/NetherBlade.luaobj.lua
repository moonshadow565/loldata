NotSingleTargetSpell = true
BuffTextureName = "Voidwalker_NullBlade.dds"
BuffName = "NetherBlade"
AutoBuffActivateEffect = ""
SpellToggleSlot = 2
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "netherblade_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "netherbladebuff"
    }
  }
}
