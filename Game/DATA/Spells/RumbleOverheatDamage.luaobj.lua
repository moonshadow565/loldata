BuffTextureName = "DrMundo_BurningAgony.dds"
BuffName = "Burning Up"
AutoBuffActivateEffect = "dr_mundo_burning_agony_cas_02.troy"
AutoBuffActivateAttachBoneName = "root"
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
AutoBuffActivateAttachBoneName3 = ""
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = true
    },
    SubBlocks = {
      {
        Function = BBGetPAROrHealth,
        Params = {
          DestVar = "MaxHealth",
          OwnerVar = "Owner",
          Function = GetMaxHealth,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "MaxHealth",
          Src1Value = 0,
          Src2Value = 100,
          DestVar = "PercHealth",
          MathOp = MO_DIVIDE
        }
      },
      {
        Function = BBMath,
        Params = {
          Src1Var = "PercHealth",
          Src1Value = 0,
          Src2Value = 1,
          DestVar = "BurnDmg",
          MathOp = MO_MULTIPLY
        }
      },
      {
        Function = BBForEachUnitInTargetArea,
        Params = {
          AttackerVar = "Owner",
          CenterVar = "Owner",
          Range = 325,
          Flags = "AffectEnemies AffectNeutral AffectMinions AffectHeroes ",
          IteratorVar = "Unit",
          InclusiveBuffFilter = true
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 0,
              DamageVar = "BurnDmg",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELLAOE,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  }
}
