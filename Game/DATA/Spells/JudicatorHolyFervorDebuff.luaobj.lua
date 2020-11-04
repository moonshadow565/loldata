BuffTextureName = "Judicator_DivineBlessing.dds"
BuffName = "JudicatorHolyFervorDebuff"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorMod,
      TargetVar = "Owner",
      Delta = -0.03
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentSpellBlockMod,
      TargetVar = "Owner",
      Delta = -0.03
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorMod,
      TargetVar = "Owner",
      Delta = -0.03
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentSpellBlockMod,
      TargetVar = "Owner",
      Delta = -0.03
    }
  }
}
