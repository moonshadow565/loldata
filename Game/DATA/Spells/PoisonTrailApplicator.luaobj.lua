AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "DamagePerTick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetTargetable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSuppressCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetIgnoreCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetNoRender
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetInvulnerable
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Owner",
      TargetVar = "Owner",
      Damage = 5000,
      DamageType = TRUE_DAMAGE,
      SourceDamageType = DAMAGESOURCE_INTERNALRAW,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetIgnoreCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetSuppressCallForHelp
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = false,
      Status = SetTargetable
    }
  },
  {
    Function = BBSetStatus,
    Params = {
      TargetVar = "Owner",
      SrcValue = true,
      Status = SetGhosted
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Attacker",
      CenterVar = "Owner",
      Range = 180,
      Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBGetBuffCountFromAll,
        Params = {
          DestVar = "Count",
          TargetVar = "Unit",
          BuffName = "PoisonTrailMarker"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "Count",
          Value2 = 0,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "PoisonTrailMarker",
              BuffAddType = BUFF_REPLACE_EXISTING,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 0.5,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamagePerTick",
              DestVarTable = "NextBuffVars",
              SrcVar = "DamagePerTick",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Unit",
              AttackerVar = "Attacker",
              BuffName = "PoisonTrailTarget",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Slow,
              MaxStack = 1,
              NumberStacks = 1,
              Duration = 2.1,
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
    Function = BBPreloadSpell,
    Params = {
      Name = "poisontrailmarker"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "poisontrailtarget"
    }
  }
}
