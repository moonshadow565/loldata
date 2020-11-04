OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "teamID"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "SonaPowerChordReady_blue.troy",
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
      FollowsGroundTilt = false
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaAriaofPerseveranceCheck"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaSongofDiscordCheck"
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 2,
      SlotType = ExtraSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "SonaHymnofValorAttackUpgrade",
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
      Name = "sonapowerchordready_blue.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaariaofperseverancecheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscordcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonahymnofvalorattackupgrade"
    }
  }
}
