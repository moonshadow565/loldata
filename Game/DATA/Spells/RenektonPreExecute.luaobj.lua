NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Renekton_Execute.dds"
BuffName = "RenektonExecuteReady"
AutoBuffActivateEffect = "Renekton_Weapon_Hot.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
SpellToggleSlot = 2
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
