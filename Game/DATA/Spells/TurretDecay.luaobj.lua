BuffTextureName = "1020_Glowing_Orb.dds"
BuffName = "Turret Decay"
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 60,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatArmorMod,
          TargetVar = "Owner",
          DestVar = "ArmorCheck"
        }
      },
      {
        Function = BBGetStat,
        Params = {
          Stat = GetFlatSpellBlockMod,
          TargetVar = "Owner",
          DestVar = "SpellBlockCheck"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "ArmorCheck",
          Value2 = 5,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBIncPermanentStat,
            Params = {
              Stat = IncPermanentFlatArmorMod,
              TargetVar = "Owner",
              DeltaVar = "ArmorCheck",
              Delta = 0
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIncPermanentStat,
            Params = {
              Stat = IncPermanentFlatArmorMod,
              TargetVar = "Owner",
              Delta = -5
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "SpellBlockCheck",
          Value2 = 5,
          CompareOp = CO_LESS_THAN
        },
        SubBlocks = {
          {
            Function = BBIncPermanentStat,
            Params = {
              Stat = IncPermanentFlatSpellBlockMod,
              TargetVar = "Owner",
              DeltaVar = "SpellBlockCheck",
              Delta = 0
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBIncPermanentStat,
            Params = {
              Stat = IncPermanentFlatSpellBlockMod,
              TargetVar = "Owner",
              Delta = -5
            }
          }
        }
      }
    }
  }
}
