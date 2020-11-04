BuffTextureName = "Evelynn_Drink.dds"
BuffName = "MaliceAndSpite"
AutoBuffActivateEffect = "Eve_ExudingEmbrace_tar.troy"
AutoBuffActivateAttachBoneName = "head"
AutoBuffActivateEffect2 = "Eve_ExudingEmbrace_tar.troy"
AutoBuffActivateAttachBoneName2 = "r_foot"
AutoBuffActivateEffect3 = "Eve_ExudingEmbrace_tar.troy"
AutoBuffActivateAttachBoneName3 = "l_foot"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMissChanceMod,
      TargetVar = "Owner",
      Delta = 1
    }
  },
  {
    Function = BBApplyAssistMarker,
    Params = {
      Duration = 10,
      TargetVar = "Owner",
      SourceVar = "Attacker"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatMissChanceMod,
      TargetVar = "Owner",
      Delta = 1
    }
  }
}
SelfExecuteBuildingBlocks = {
  {
    Function = BBGetCastSpellTargetPos,
    Params = {DestVar = "TargetPos"}
  },
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Nothing",
      PosVar = "TargetPos",
      EffectName = "Eve_ExudingEmbrace_nova.troy",
      Flags = 0,
      EffectIDVar = "Particle",
      TargetObjectVar = "Owner",
      TargetPosVar = "TargetPos",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = true
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "TargetPos",
      Range = 200,
      Flags = "AffectEnemies AffectHeroes ",
      IteratorVar = "Unit",
      InclusiveBuffFilter = true
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Blind,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "SlowPercent",
          DestVarTable = "NextBuffVars",
          SrcValueByLevel = {
            -0.4,
            -0.5,
            -0.6
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "MaliceAndSpiteSlow",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Slow,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 3,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false
        }
      },
      {
        Function = BBApplyAssistMarker,
        Params = {
          Duration = 10,
          TargetVar = "Owner",
          SourceVar = "Owner"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "eve_exudingembrace_nova.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "maliceandspiteslow"
    }
  }
}
