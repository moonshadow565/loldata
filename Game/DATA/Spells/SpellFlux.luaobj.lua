NotSingleTargetSpell = false
DoesntBreakShields = false
DoesntTriggerSpellCasts = false
CastingBreaksStealth = true
IsDamagingSpell = true
BuffTextureName = "Ryze_LightningFlux.dds"
BuffName = "Spell Flux"
SpellDamageRatio = 1
AutoCooldownByLevel = {
  150,
  120,
  90
}
ChainMissileParameters = {
  MaximumHits = {
    5,
    5,
    5,
    5,
    5
  },
  CanHitCaster = 1,
  CanHitSameTarget = 1,
  CanHitSameTargetConsecutively = 0
}
TriggersSpellCasts = true
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ResistanceMod",
      DestVarTable = "InstanceVars",
      SrcValue = -15
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ResistanceMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBGetBuffCountFromCaster,
    Params = {
      DestVar = "Count",
      TargetVar = "Owner",
      CasterVar = "Attacker",
      BuffName = "SpellFlux"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Count",
      Src2Var = "ResistanceMod",
      Src2VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "MR",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "MR",
      Src1Value = 0,
      Src2Value = -1,
      DestVar = "MR",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetBuffToolTipVar,
    Params = {
      Value = 0,
      ValueVar = "MR",
      Index = 1
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "ResistanceMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Damage",
      SrcValueByLevel = {
        50,
        70,
        90,
        110,
        130
      }
    }
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
    Function = BBSetVarInTable,
    Params = {
      DestVar = "AoEDamage",
      SrcValueByLevel = {
        0.75,
        0.75,
        0.75
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Damage",
      Src2Var = "AoEDamage",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "UltDamage",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Target",
      Src2Var = "Owner",
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffAddType = BUFF_STACKS_AND_RENEWS,
          BuffType = BUFF_CombatDehancer,
          MaxStack = 4,
          NumberStacks = 1,
          Duration = 5,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0
        }
      },
      {
        Function = BBGetCastInfo,
        Params = {DestVar = "TargetNum", Info = GetCastSpellTargetsHitPlusOne}
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "TargetNum",
          Value2 = 1,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "Damage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.33,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "Damage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.33,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      },
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "DesperatePower"
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "ManaLeach_tar.troy",
              Flags = 0,
              EffectIDVar = "part",
              TargetObjectVar = "Target",
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
              CenterVar = "Target",
              Range = 300,
              Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
              IteratorVar = "Unit"
            },
            SubBlocks = {
              {
                Function = BBIf,
                Params = {
                  Src1Var = "Target",
                  Src2Var = "Unit",
                  CompareOp = CO_NOT_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSpellEffectCreate,
                    Params = {
                      BindObjectVar = "Unit",
                      EffectName = "ManaLeach_tar.troy",
                      Flags = 0,
                      EffectIDVar = "part",
                      TargetObjectVar = "Unit",
                      SpecificUnitOnlyVar = "Owner",
                      SpecificTeamOnly = TEAM_UNKNOWN,
                      UseSpecificUnit = false,
                      FOWTeam = TEAM_UNKNOWN,
                      FOWVisibilityRadius = 0,
                      SendIfOnScreenOrDiscard = true
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 0,
                      DamageVar = "UltDamage",
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_SPELLAOE,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0.33,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  }
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
    Function = BBPreloadSpell,
    Params = {Name = "spellflux"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "desperatepower"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "manaleach_tar.troy"
    }
  }
}
