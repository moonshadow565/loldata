BuffTextureName = "SadMummy_CorpseExplosion.dds"
BuffName = "CursedTouch"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MagicResistReduction",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "MagicResistReduction",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
