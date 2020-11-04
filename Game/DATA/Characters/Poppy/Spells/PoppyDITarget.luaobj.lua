BuffTextureName = "Poppy_DiplomaticImmunity.dds"
BuffName = "PoppyDITarget"
AutoBuffActivateEffect = "DiplomaticImmunity_tar.troy"
NonDispellable = true
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poppydiplomaticimmunity"
    }
  }
}
