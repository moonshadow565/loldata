BuffName = "SowTheWindCastMarker"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      TargetType = TTYPE_Self,
      TargetVar = "Owner"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetTargetingType,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      TargetType = TTYPE_Target,
      TargetVar = "Owner"
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "SowTheWind",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetBuffCasterUnit,
        Params = {CasterVar = "Caster"}
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Caster",
          AttackerVar = "Owner",
          BuffName = "SowTheWind"
        }
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Caster",
          BuffName = "SowTheWindCastMarker"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {Name = "sowthewind"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sowthewindcastmarker"
    }
  }
}
