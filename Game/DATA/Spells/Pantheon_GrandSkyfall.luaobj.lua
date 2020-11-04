ChannelDuration = 3
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "TargetPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "ExpirationTimer",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 4,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  },
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "TeamOfOwner",
      Radius = 700,
      PosVar = "TargetPos",
      Duration = 4,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "Particle2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
ChannelingStartBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBGetCastSpellTargetPos,
    Params = {
      DestVar = "TargetPos",
      DestVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "CastPosition",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "TeamOfOwner",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "CastPosition",
          EffectName = "pirate_cannonBarrage_aoe_indicator_red.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "CastPosition",
          EffectName = "pirate_cannonBarrage_aoe_indicator_green.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "CastPosition",
          EffectName = "pirate_cannonBarrage_aoe_indicator_red.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "CastPosition",
          EffectName = "pirate_cannonBarrage_aoe_indicator_green.troy",
          Flags = 0,
          EffectIDVar = "Particle2",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Target",
          SpecificUnitOnlyVar = "Nothing",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = true,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 500,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBAddPosPerceptionBubble,
    Params = {
      TeamVar = "TeamOfOwner",
      Radius = 700,
      PosVar = "CastPosition",
      Duration = 5,
      SpecificUnitsClientOnlyVar = "Nothing",
      RevealSteath = false,
      BubbleIDVar = "BubbleID",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Caster",
      AttackerVar = "Attacker",
      BuffName = "Pantheon_GrandSkyfallAni",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "EnemyHeroes",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "TargetPos",
      SrcVar = "TargetPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBTeleportToPosition,
    Params = {OwnerVar = "Owner", CastPositionName = "TargetPos"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageRank",
      SrcValueByLevel = {
        200,
        300,
        400
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AttackSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedMod",
      DestVarTable = "NextBuffVars",
      SrcValue = -0.35
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "TargetPos",
      Range = 750,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBDistanceBetweenObjectAndPoint,
        Params = {
          DestVar = "Distance",
          ObjectVar = "Unit",
          PointVar = "TargetPos"
        }
      },
      {
        Function = BBMath,
        Params = {
          Src2Var = "Distance",
          Src1Value = 750,
          Src2Value = 0,
          DestVar = "DistMod",
          MathOp = MO_SUBTRACT
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DistMod",
          Src1Value = 0,
          Src2Value = 750,
          DestVar = "DistMod",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DistMod",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "DistMod",
          MathOp = MO_ADD
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "DistMod",
          Src2Var = "DamageRank",
          Src1Value = 0,
          Src2Value = 0,
          DestVar = "FinalDmg",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Unit",
          Damage = 0,
          DamageVar = "FinalDmg",
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELL,
          PercentOfAttack = 1,
          SpellDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "Slow",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Slow,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Unit",
          EffectName = "Global_Mortal_Strike.troy",
          Flags = 0,
          EffectIDVar = "a",
          BoneName = "head",
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
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "TargetPos",
      EffectName = "Starcall_tar.troy",
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "expirationtimer"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pirate_cannonbarrage_aoe_indicator_red.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "pirate_cannonbarrage_aoe_indicator_green.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "slow"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "global_mortal_strike.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "starcall_tar.troy"
    }
  }
}
