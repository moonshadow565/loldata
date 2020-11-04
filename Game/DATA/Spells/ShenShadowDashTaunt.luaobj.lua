BuffTextureName = "GSB_taunt.dds"
BuffName = "Shen Shadow Dash Taunt"
AutoBuffActivateEffect = "Global_Taunt_multi_unit.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Taunted"
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "Taunt"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "taunt"}
  }
}
