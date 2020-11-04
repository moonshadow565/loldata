NotSingleTargetSpell = false
DoesntBreakShields = true
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
AutoBuffActivateEffect = "Interventionspeed_buf.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "Pos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Pos",
      SrcVar = "Pos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBMove,
    Params = {
      UnitVar = "Target",
      TargetVar = "Pos",
      Speed = 900,
      Gravity = 30,
      MoveBackBy = 0,
      MovementType = FURTHEST_WITHIN_RANGE,
      MovementOrdersType = POSTPONE_CURRENT_ORDER,
      IdealDistance = 375
    }
  }
}
OnBuffDeactivateBuildingBlocks = {}
TargetExecuteBuildingBlocks = {
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 375,
      OffsetAngle = 0,
      PositionVar = "Pos"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Pos",
      DestVarTable = "NextBuffVars",
      SrcVar = "Pos"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Target",
      EffectName = "nidalee_cougarPounce_cas.troy",
      Flags = 0,
      TargetObjectVar = "Target",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  }
}
BuffOnMoveEndBuildingBlocks = {
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "nidalee_cougarPounce_land.troy",
      Flags = 0,
      EffectIDVar = "hi",
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
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 225,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "nidalee_cougar_pounce_tar.troy",
          Flags = 0,
          EffectIDVar = "bye",
          TargetObjectVar = "Unit",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "PounceDamage",
          DamageVarTable = "CharVars",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.4,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_cougarpounce_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_cougarpounce_land.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nidalee_cougar_pounce_tar.troy"
    }
  }
}
