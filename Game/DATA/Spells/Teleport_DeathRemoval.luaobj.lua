BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "Name", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Name",
      Value2 = "teleportcancel",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetBuffCasterUnit,
        Params = {CasterVar = "Caster"}
      },
      {
        Function = BBIf,
        Params = {Src1Var = "Caster", CompareOp = CO_IS_TYPE_TURRET},
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Caster",
              AttackerVar = "Owner",
              BuffName = "Teleport_Turret"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Caster",
              AttackerVar = "Owner",
              BuffName = "Teleport_Target"
            }
          }
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}
BuffOnDeathBuildingBlocks = {
  {
    Function = BBSetBuffCasterUnit,
    Params = {CasterVar = "Caster"}
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Caster", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Caster", CompareOp = CO_IS_TYPE_TURRET},
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Caster",
              AttackerVar = "Owner",
              BuffName = "Teleport_Turret"
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Caster",
              AttackerVar = "Owner",
              BuffName = "Teleport_Target"
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellBuffRemoveCurrent,
    Params = {TargetVar = "Owner"}
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teleport_turret"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "teleport_target"
    }
  }
}
