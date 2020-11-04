PopupMessage1 = "game_floatingtext_Stunned"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Attacker"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "UnstoppableForce_tar.troy",
      Flags = 0,
      EffectIDVar = "TargetParticle",
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "StunDuration",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Level",
      SrcVar = "Level",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBApplyStun,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Duration = 0,
      DurationVar = "StunDuration",
      DurationVarTable = "InstanceVars"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 100,
      OffsetAngle = 180,
      PositionVar = "OwnerPos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Position",
      DestVarTable = "NextBuffVars",
      SrcVar = "OwnerPos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Speed",
      DestVarTable = "NextBuffVars",
      SrcValue = 100
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Gravity",
      DestVarTable = "NextBuffVars",
      SrcValue = 20
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "Move",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_CombatDehancer,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 1.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "unstoppableforce_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "move"}
  }
}
