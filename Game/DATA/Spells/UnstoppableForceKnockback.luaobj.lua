OnBuffActivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "UnstoppableForceStun"
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBRequireVar,
        Params = {
          RequiredVar = "Level",
          RequiredVarTable = "InstanceVars"
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "Level",
          SrcVar = "Level",
          SrcVarTable = "InstanceVars"
        }
      },
      {
        Function = BBDistanceBetweenObjects,
        Params = {
          DestVar = "Distance",
          ObjectVar1 = "Attacker",
          ObjectVar2 = "Owner"
        }
      },
      {
        Function = BBGetRandomPointInAreaUnit,
        Params = {
          TargetVar = "Owner",
          Radius = 310,
          InnerRadius = 300,
          ResultVar = "LandingPos"
        }
      },
      {
        Function = BBDistanceBetweenObjectAndPoint,
        Params = {
          DestVar = "DistanceTwo",
          ObjectVar = "Attacker",
          PointVar = "LandingPos"
        }
      },
      {
        Function = BBMove,
        Params = {
          UnitVar = "Owner",
          TargetVar = "LandingPos",
          Speed = 1000,
          Gravity = 35,
          MoveBackBy = 0
        }
      },
      {
        Function = BBApplyDamage,
        Params = {
          AttackerVar = "Attacker",
          TargetVar = "Owner",
          DamageByLevel = {
            50,
            100,
            150,
            200,
            250
          },
          Damage = 0,
          DamageType = MAGIC_DAMAGE,
          SourceDamageType = DAMAGESOURCE_DEFAULT,
          PercentOfAttack = 1,
          SpellDamageRatio = 1
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "unstoppableforcestun"
    }
  }
}
