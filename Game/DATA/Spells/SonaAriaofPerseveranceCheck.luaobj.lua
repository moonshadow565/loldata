OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "SonaPowerChordReady_green.troy",
      Flags = 0,
      EffectIDVar = "particleID",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWTeamOverrideVar = "teamID",
      FOWVisibilityRadius = 10,
      SendIfOnScreenOrDiscard = false,
      PersistsThroughReconnect = false,
      BindFlexToOwnerPAR = false,
      FollowsGroundTilt = false,
      FacesTarget = false
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaHymnofValorCheck",
      ResetDuration = 0
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaSongofDiscordCheck",
      ResetDuration = 0
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = ExtraSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "SonaAriaofPerseveranceUpgrade",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 2,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1,
      CancelAttack = false
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "particleID",
      EffectIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "sonapowerchordready_green.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaariaofperseveranceupgrade"
    }
  }
}
