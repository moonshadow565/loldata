NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Yeti_Consume.dds"
BuffName = ""
AutoBuffActivateEffect = "Consume_buf.troy"
AutoCooldownByLevel = {
  35,
  30,
  25,
  20,
  15
}
SpellVOOverrideSkins = {"NunuBot"}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "meditate_eff.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "resistantskin"
    }
  }
}
