NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Renekton_Execute.dds"
BuffName = "RenektonExecuteReady"
AutoBuffActivateEffect = "Renekton_Weapon_Hot.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_HEAD_LOC"
AutoBuffActivateEffect2 = "Renekton_Runewars_Rage_Skin.troy"
SpellToggleSlot = 2
SpellFXOverrideSkins = {
  "RenektonSkin06"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "renekton_ruthlesspredator_obd-sound.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonunlockanimation"
    }
  }
}
