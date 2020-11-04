BuffTextureName = "SkarnerImpale.dds"
BuffName = "SkarnerImpaleBuff"
BuffOnDeathBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Caster",
      BuffName = "SkarnerImpale"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "skarnerimpale"
    }
  }
}
