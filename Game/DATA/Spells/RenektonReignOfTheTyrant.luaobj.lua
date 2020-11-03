NotSingleTargetSpell = true
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Renekton_Dominus.dds"
BuffName = "RenekthonTyrantForm"
AutoBuffActivateEffect = "RenektonDominus_sword.troy"
AutoBuffActivateAttachBoneName = "weapon"
AutoBuffActivateEffect2 = "RenektonDominus_aura.troy"
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "renektonincombat"
    }
  }
}
