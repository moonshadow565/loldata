BuffTextureName = "48thSlave_Tattoo.dds"
BuffName = "OdinCenterShrineBuff"
Nondispellable = true
BuffOnDeathBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 300,
      Flags = "AffectEnemies AffectFriends AffectNeutral AffectMinions AffectUseable ",
      IteratorVar = "Unit",
      BuffNameFilter = "OdinGuardianBuff",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBSpellBuffClear,
        Params = {
          TargetVar = "Unit",
          BuffName = "OdinQuestIndicator"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardianbuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinquestindicator"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "odinquestindicator"
    }
  }
}
