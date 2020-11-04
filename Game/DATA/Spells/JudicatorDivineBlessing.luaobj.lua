NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Judicator_AngelicEmbrace.dds"
BuffName = "JudicatorDivineBlessing"
AutoBuffActivateEffect = "InterventionHeal_buf.troy"
AutoBuffActivateEffect2 = "Interventionspeed_buf.troy"
AutoBuffActivateAttachBoneName2 = "root"
SpellFXOverrideSkins = {
  "MetalWingedJudicator"
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "kayledivineblessinganim"
    }
  }
}
