BuffTextureName = "Kennen_ElectricalSurge.dds"
BuffName = "KennenDoubleStrikeLive"
AutoBuffActivateEffect = "kennen_ds_proc.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE__HAND_R"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 1,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 0,
      AutoAttackSpellLevelVar = "Level",
      CancelAttack = true
    }
  }
}
