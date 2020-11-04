BuffTextureName = "Averdrian_AstralBarrier.dds"
BuffName = "AlZaharVoidlingPhase3"
AutoBuffActivateEffect = "AlzaharVoidling_speed.troy"
AutoBuffActivateAttachBoneName = "BUFFBONE_GLB_HAND_R"
AutoBuffActivateEffect2 = "AlzaharVoidling_speed.troy"
AutoBuffActivateAttachBoneName2 = "BUFFBONE_GLB_HAND_L"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "alzaharvoidling_evo.troy",
      Flags = 0,
      EffectIDVar = "varrr",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentAttackSpeedMod,
      TargetVar = "Owner",
      Delta = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "alzaharvoidling_evo.troy"
    }
  }
}
