BuffTextureName = "3026_Guardian_Angel.dds"
BuffName = "Guardian Angel"
AutoBuffActivateEffect = "rebirthready.troy"
AutoBuffActivateAttachBoneName = "spine"
PersistsThroughDeath = true
NonDispellable = true
OnPreDamagePriority = 6
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "willrevive"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "hasbeenrevived"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "guardianangel"
    }
  }
}
