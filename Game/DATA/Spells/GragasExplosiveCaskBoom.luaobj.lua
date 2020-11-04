TargetExecuteBuildingBlocks = {
  {
    Function = BBGetTeamID,
    Params = {
      TargetVar = "Owner",
      DestVar = "TeamofOwner"
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
    Function = BBIf,
    Params = {
      Src1Var = "TeamofOwner",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "Target",
          EffectName = "gragas_caskboom.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          TargetObjectVar = "Owner",
          TargetPosVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 100,
          SendIfOnScreenOrDiscard = true
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
          PosVar = "Target",
          EffectName = "gragas_caskboom.troy",
          Flags = 0,
          EffectIDVar = "Particle",
          TargetObjectVar = "Owner",
          TargetPosVar = "Target",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 100,
          SendIfOnScreenOrDiscard = true
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ASDebuff",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        -0.2,
        -0.3,
        -0.4
      }
    }
  },
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Target",
      Range = 430,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBBreakSpellShields,
        Params = {TargetVar = "Unit"}
      },
      {
        Function = BBGetCastSpellTargetPos,
        Params = {DestVar = "Center"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Speed",
          DestVarTable = "NextBuffVars",
          SrcValue = 900
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Gravity",
          DestVarTable = "NextBuffVars",
          SrcValue = 5
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Center",
          DestVarTable = "NextBuffVars",
          SrcVar = "Center"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Distance",
          DestVarTable = "NextBuffVars",
          SrcValue = 900
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Unit",
          DamageByLevel = {
            200,
            325,
            450
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_SPELLAOE,
          PercentOfAttack = 1,
          SpellDamageRatio = 0.8,
          PhysicalDamageRatio = 1,
          IgnoreDamageIncreaseMods = false,
          IgnoreDamageCrit = false
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TeamofOwner",
          Value2 = TEAM_ORDER,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Unit",
              PosVar = "Unit",
              EffectName = "gragas_caskwine_tar.troy",
              Flags = 0,
              EffectIDVar = "arr",
              TargetObjectVar = "Unit",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_ORDER,
              FOWVisibilityRadius = 100,
              SendIfOnScreenOrDiscard = true
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
              BindObjectVar = "Unit",
              PosVar = "Unit",
              EffectName = "gragas_caskwine_tar.troy",
              Flags = 0,
              EffectIDVar = "arr",
              TargetObjectVar = "Unit",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_CHAOS,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "MoveAwayCollision",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_Stun,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0.5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Unit",
          AttackerVar = "Attacker",
          BuffName = "GragasExplosiveCaskDebuff",
          BuffAddType = BUFF_REPLACE_EXISTING,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 0,
          BuffVarsTable = "NextBuffVars",
          DurationByLevel = {
            3,
            4,
            5
          },
          TickRate = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_caskboom.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "gragas_caskwine_tar.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "moveawaycollision"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasexplosivecaskdebuff"
    }
  }
}
