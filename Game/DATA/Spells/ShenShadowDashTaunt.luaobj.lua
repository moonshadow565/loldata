BuffTextureName = "GSB_taunt.dds"
BuffName = "Shen Shadow Dash Taunt"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
PopupMessage1 = "game_floatingtext_Taunted"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Attacker", DestVar = "TeamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "Global_Taunt_multi_unit.troy",
      Flags = 0,
      EffectIDVar = "asdf1",
      EffectIDVarTable = "InstanceVars",
      BoneName = "C_BUFFBONE_GLB_HEAD_LOC",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "TeamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = true
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "Taunt"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "asdf1",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_taunt_multi_unit.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "taunt"}
  }
}
