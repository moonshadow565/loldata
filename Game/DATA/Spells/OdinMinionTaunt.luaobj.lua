NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Soraka_Bless.dds"
BuffName = "OdinMinionTaunt"
AutoBuffActivateEffect = "odin_minion_tower_buf.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
AutoBuffActivateAttachBoneName2 = ""
AutoBuffActivateEffect3 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageTakenFromGuardian",
      DestVarTable = "InstanceVars",
      SrcValue = 0.8
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "MoveSpeedBuff",
      DestVarTable = "InstanceVars",
      SrcValue = 0.25
    }
  },
  {
    Function = BBApplyTaunt,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Owner",
      Duration = 1
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ArmorBuff",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "MagicResistBuff",
      RequiredVarTable = "InstanceVars"
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentMovementSpeedMod,
      TargetVar = "Owner",
      DeltaVar = "MoveSpeedBuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatSpellBlockMod,
      TargetVar = "Owner",
      DeltaVar = "MagicResistBuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatArmorMod,
      TargetVar = "Owner",
      DeltaVar = "ArmorBuff",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
BuffOnTakeDamageBuildingBlocks = {
  {
    Function = BBGetUnitSkinName,
    Params = {
      TargetVar = "Attacker",
      DestVar = "AttackerSkinName"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageMultiplier",
      SrcValue = 1
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "OdinGuardianBuff"
    },
    SubBlocks = {
      {
        Function = BBGetTeamID,
        Params = {
          TargetVar = "Attacker",
          DestVar = "AttackerTeam"
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "AttackerTeam",
          Value2 = TEAM_NEUTRAL,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "DamageMultiplier",
              SrcVar = "DamageTakenFromGuardian",
              SrcVarTable = "InstanceVars",
              SrcValue = 0
            }
          }
        }
      }
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "DamageMultiplier",
      Src2Var = "DamageAmount",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "DamageAmount",
      MathOp = MO_MULTIPLY
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "odinguardianbuff"
    }
  }
}
