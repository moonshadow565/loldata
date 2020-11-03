BuffTextureName = "Heimerdinger_Level2Turret.dds"
BuffName = "UrAniumRounds"
BuffOnSpellHitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
        SubBlocks = {
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "teamID"}
          },
          {
            Function = BBGetChampionBySkinName,
            Params = {
              Skin = "Heimerdinger",
              Team = TEAM_UNKNOWN,
              TeamVar = "teamID",
              DestVar = "Attacker"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Attacker",
              BuffName = "UrAniumRoundsHit",
              BuffAddType = BUFF_STACKS_AND_RENEWS,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 25,
              NumberOfStacks = 1,
              Duration = 3,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false,
              IsHiddenOnClient = false
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Attacker",
              BuffName = "UpgradeSlow"
            },
            SubBlocks = {
              {
                Function = BBSpellEffectCreate,
                Params = {
                  BindObjectVar = "Owner",
                  EffectName = "AbsoluteZero_tar.troy",
                  Flags = 0,
                  EffectIDVar = "faas",
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
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "heimerdinger"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "uraniumroundshit"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "upgradeslow"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "absolutezero_tar.troy"
    }
  }
}
