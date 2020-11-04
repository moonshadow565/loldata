BuffTextureName = "Tristana_ExplosiveShot.dds"
BuffName = "Detonating Shot"
AutoBuffActivateEffect = "DetonatingShot_buf.troy"
PersistsThroughDeath = true
Nondispellable = true
BuffOnKillBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Owner",
      BuffName = "DetonatingShot_Target"
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Target",
          EffectName = "DetonatingShot_buf.troy",
          Flags = 0,
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
          SpellSlotValue = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          OwnerVar = "Owner",
          Function = GetSlotSpellLevel
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
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Unit"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              TargetVar = "Unit",
              DamageByLevel = {
                50,
                75,
                100,
                125,
                150
              },
              Damage = 0,
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_PROC,
              PercentOfAttack = 1,
              SpellDamageRatio = 0.25,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Owner",
          Src2Var = "Target",
          CompareOp = CO_DIFFERENT_TEAM
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "DetonatingShot_Target",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0.1,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          }
        }
      }
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DetonatingShot"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageAmount",
      DestVarTable = "NextBuffVars",
      SrcValue = 25
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "ExplosiveShotDebuff",
      BuffAddType = BUFF_REPLACE_EXISTING,
      BuffType = BUFF_Damage,
      MaxStack = 1,
      NumberStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        4,
        5,
        6,
        7,
        8
      },
      TickRate = 1
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "detonatingshot_target"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "detonatingshot_buf.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "detonatingshot"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "explosiveshotdebuff"
    }
  }
}
