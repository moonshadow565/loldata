OnBuffActivateBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamOfOwner"
    }
  },
  {
    Function = BBForNClosestUnitsInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 25000,
      Flags = "AffectEnemies AffectBuildings AffectMinions AffectHeroes AffectTurrets ",
      IteratorVar = "Unit",
      MaximumUnitsToPick = 1,
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {TargetVar = "Unit", DestVar = "EnemyTeam"}
      }
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
        Function = BBAddUnitPerceptionBubble,
        Params = {
          TeamVar = "EnemyTeam",
          Radius = 10,
          TargetVar = "Owner",
          Duration = 2,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSpecificUnitOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "a",
          BubbleIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBAddUnitPerceptionBubble,
        Params = {
          TeamVar = "EnemyTeam",
          Radius = 10,
          TargetVar = "Attacker",
          Duration = 2,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSpecificUnitOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "a",
          BubbleIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBAddUnitPerceptionBubble,
        Params = {
          TeamVar = "EnemyTeam",
          Radius = 10,
          TargetVar = "Owner",
          Duration = 2,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSpecificUnitOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "b",
          BubbleIDVarTable = "InstanceVars"
        }
      },
      {
        Function = BBAddUnitPerceptionBubble,
        Params = {
          TeamVar = "EnemyTeam",
          Radius = 10,
          TargetVar = "Attacker",
          Duration = 2,
          SpecificUnitsClientOnlyVar = "Nothing",
          RevealSpecificUnitOnlyVar = "Nothing",
          RevealSteath = false,
          BubbleIDVar = "b",
          BubbleIDVarTable = "InstanceVars"
        }
      }
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 550,
      OffsetAngle = 0,
      PositionVar = "Beam1"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 1650,
      OffsetAngle = 0,
      PositionVar = "Beam2"
    }
  },
  {
    Function = BBGetPointByUnitFacingOffset,
    Params = {
      UnitVar = "Owner",
      Distance = 2750,
      OffsetAngle = 0,
      PositionVar = "Beam3"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetForceRenderParticles
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Attacker",
      SrcValue = true,
      Status = SetForceRenderParticles
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
          BindObjectVar = "Owner",
          EffectName = "LuxMaliceCannon_beam.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars",
          BoneName = "top",
          TargetObjectVar = "Attacker",
          TargetBoneName = "top",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "LuxMaliceCannon_beam.troy",
          Flags = 0,
          EffectIDVar = "ParticleID2",
          EffectIDVarTable = "InstanceVars",
          BoneName = "top",
          TargetObjectVar = "Attacker",
          TargetBoneName = "top",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 10,
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
          BindObjectVar = "Owner",
          EffectName = "LuxMaliceCannon_beam.troy",
          Flags = 0,
          EffectIDVar = "ParticleID",
          EffectIDVarTable = "InstanceVars",
          BoneName = "top",
          TargetObjectVar = "Attacker",
          TargetBoneName = "top",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_CHAOS,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "LuxMaliceCannon_beam.troy",
          Flags = 0,
          EffectIDVar = "ParticleID2",
          EffectIDVarTable = "InstanceVars",
          BoneName = "top",
          TargetObjectVar = "Attacker",
          TargetBoneName = "top",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_ORDER,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 10,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "ParticleID2",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "a",
      BubbleIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRemovePerceptionBubble,
    Params = {
      BubbleIDVar = "b",
      BubbleIDVarTable = "InstanceVars"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "luxmalicecannon_beam.troy"
    }
  }
}
