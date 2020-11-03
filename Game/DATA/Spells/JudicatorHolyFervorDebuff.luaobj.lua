BuffTextureName = "Judicator_DivineBlessing.dds"
BuffName = "JudicatorHolyFervorDebuff"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentArmorMod,
      TargetVar = "Owner",
      Delta = -0.02
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentSpellBlockMod,
      TargetVar = "Owner",
      Delta = -0.02
    }
  }
}
