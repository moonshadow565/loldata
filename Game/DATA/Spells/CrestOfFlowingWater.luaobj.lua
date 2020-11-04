BuffTextureName = "WaterWizard_Typhoon.dds"
BuffName = "Crest Of Flowing Water"
Nondispellable = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSpellEffectCreate,
    Params = {
      BindObjectVar = "Owner",
      EffectName = "invis_runes_01.troy",
      Flags = 0,
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars",
      TargetObjectVar = "Owner",
      SpecificUnitOnlyVar = "Owner",
      SpecificTeamOnly = TEAM_UNKNOWN,
      UseSpecificUnit = false,
      FOWTeam = TEAM_UNKNOWN,
      FOWVisibilityRadius = 0,
      SendIfOnScreenOrDiscard = false
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentMovementSpeedMod,
      TargetVar = "Owner",
      Delta = 0.45
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "buffParticle",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncPermanentStat,
    Params = {
      Stat = IncPermanentPercentMovementSpeedMod,
      TargetVar = "Owner",
      Delta = -0.45
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Attacker", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Attacker",
              AttackerVar = "Attacker",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 60,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "invis_runes_01.troy"
    }
  }
}
