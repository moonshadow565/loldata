NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
ChannelDuration = 3
BuffTextureName = "Yeti_Shatter.dds"
BuffName = "Absolute Zero"
AutoBuffActivateEffect = "AbsoluteZero3_cas.troy"
AutoBuffActivateAttachBoneName = ""
SpellFXOverrideSkins = {"NunuBot"}
SpellVOOverrideSkins = {""}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "absolutezero2_green_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "absolutezero2_red_cas.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "absolutezeroslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "absolutezero"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "absolutezero_nova.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "absolutezero_tar.troy"
    }
  }
}
