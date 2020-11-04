NotSingleTargetSpell = true
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 4
BuffTextureName = "Janna_ReapTheWhirlwind.dds"
BuffName = "Reap The Whirlwind"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "reapthewhirlwind_green_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "reapthewhirlwind_red_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "moveaway"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "reapthewhirlwind"
    }
  }
}
