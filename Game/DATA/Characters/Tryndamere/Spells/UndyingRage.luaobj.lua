NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "DarkChampion_EndlessRage.dds"
BuffName = "Undying Rage"
AutoBuffActivateEffect = "UndyingRage_buf.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = "UndyingRageSpine_glow.troy"
AutoBuffActivateAttachBoneName4 = "spine"
AutoCooldownByLevel = {
  110,
  100,
  90
}
NonDispellable = true
OnPreDamagePriority = 2
SpellFXOverrideSkins = {
  "TryndamereDemonsword"
}
SpellVOOverrideSkins = {
  "TryndamereDemonsword"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "undyingrage_glow.troy"
    }
  }
}
