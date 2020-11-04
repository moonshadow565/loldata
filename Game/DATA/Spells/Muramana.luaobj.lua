NotSingleTargetSpell = true
DoesntTriggerSpellCasts = true
BuffTextureName = "3042_Muramana.dds"
BuffName = "Muramana"
AutoBuffActivateEffect = "ItemMuramanaToggle.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_GLB_WEAPON_1"
AutoCooldownByLevel = {
  0,
  0,
  0,
  0,
  0
}
PersistsThroughDeath = true
NonDispellable = true
DoOnPreDamageInExpirationOrder = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "itemmuramana_activate.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "muramana"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "itemmuramana.troy"
    }
  }
}
