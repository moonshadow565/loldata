NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
ChannelDuration = 2
BuffTextureName = "Galio_IdolOfDurand.dds"
BuffName = "GalioIdolOfDurand"
AutoBuffActivateEffect = ""
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_beguilingstatue_taunt_indicator_team_green.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_beguilingstatue_taunt_indicator_team_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_talion_channel.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_talion_breakout.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_builingstatue_impact_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "taunt"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galioidolofdurandtaunt"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "galio_builingstatue_unit_impact_01.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galioidolofdurandmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "galioidolofdurand"
    }
  }
}
