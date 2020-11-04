BuffTextureName = "Odin_SpeedShrine.dds"
BuffName = "TT_SpeedShrine_Buff"
AutoBuffActivateEffect = "tt_speedshrine_buf.troy"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "howlingabyssporoaction"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "howlingabyssporocooldown"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "howlingabyssporoanimation1"
    }
  }
}
