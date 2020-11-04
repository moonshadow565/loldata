NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "3114_Malady.dds"
BuffName = "Malady"
SpellVOOverrideSkins = {"BroOlaf"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianna_ball_flash.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "root"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghostself"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "orianna_ball_flash_reverse.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaghost"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaredactshield"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "orianaredactdamage"
    }
  }
}
