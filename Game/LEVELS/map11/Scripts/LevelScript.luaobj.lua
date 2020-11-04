EOG_SCOREBOARD_PHASE_DELAY_TIME = 1.2
MAX_MINIONS_EVER = 180
TEAM_UNKNOWN = 0
TEAM_ORDER = 100
TEAM_CHAOS = 200
TEAM_NEUTRAL = 300
ORDER_HQ = 1
CHAOS_HQ = 2
FRONT_TOWER = 3
MIDDLE_TOWER = 2
BACK_TOWER = 1
HQ_TOWER2 = 4
HQ_TOWER1 = 5
RIGHT_LANE = 0
CENTER_LANE = 1
LEFT_LANE = 2
INITIAL_TIME_TO_SPAWN = 90
CANNON_MINION_SPAWN_FREQUENCY = 3
INCREASE_CANNON_RATE_TIMER = 1200
INCREASE_CANNON_RATE_TIMER2 = 2100
MINION_HEALTH_DENIAL_PERCENT = 0
UPGRADE_MINION_TIMER = 90
UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING = 6
TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION = 3
EXP_GIVEN_RADIUS = 1400
GOLD_GIVEN_RADIUS = 1250
DISABLE_MINION_SPAWN_BASE_TIME = 300
DISABLE_MINION_SPAWN_MAG_TIME = 0
CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11.67
ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION = 11
LAST_WAVE = -1
SPECIAL_MINION_MODE = "none"
HQTurretAttackable = false
UpgradedMinionIterations = 0
DoLuaLevel("BBLuaConversionLibrary")
SpawnTable = {
  WaveSpawnRate = 30000,
  SingleMinionSpawnDelay = 800,
  ExpRadius = EXP_GIVEN_RADIUS,
  GoldRadius = GOLD_GIVEN_RADIUS
}
MeleeDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 1,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0.625,
  HPBonus = 0,
  HPUpgrade = 13,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 2,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 0.5,
  DamageInhibitor = 0,
  ExpGiven = 64,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 19.8,
  GoldBonus = 0,
  GoldUpgrade = 0.2,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 12,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CasterDefaultMinionInfo = {
  DefaultNumPerWave = 3,
  Armor = 0,
  ArmorUpgrade = 0.625,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1,
  HPBonus = 0,
  HPUpgrade = 10,
  HPUpgradeGrowth = 0.2,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 1,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1,
  DamageInhibitor = 0,
  ExpGiven = 32,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 14.8,
  GoldBonus = 0,
  GoldUpgrade = 0.2,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 8,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
CannonDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 1.5,
  MagicResistance = 0,
  MagicResistanceUpgrade = 1.5,
  HPBonus = 0,
  HPUpgrade = 23,
  HPUpgradeGrowth = 0.3,
  HPUpgradeLate = TOWER_DAMAGE_PER_UPGRADE_MINION_ITERATION * 3,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 1.5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 39.5,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
SuperDefaultMinionInfo = {
  DefaultNumPerWave = 0,
  Armor = 0,
  ArmorUpgrade = 0,
  MagicResistance = 0,
  MagicResistanceUpgrade = 0,
  HPBonus = 0,
  HPUpgrade = 100,
  HPUpgradeGrowth = 0,
  HPUpgradeLate = 0,
  HPUpgradeGrowthLate = 0,
  HPInhibitor = 0,
  DamageBonus = 0,
  DamageUpgrade = 5,
  DamageInhibitor = 0,
  ExpGiven = 100,
  ExpBonus = 0,
  ExpUpgrade = 0,
  ExpInhibitor = 0,
  GoldGiven = 39.5,
  GoldBonus = 0,
  GoldUpgrade = 0.5,
  GoldInhibitor = 0,
  GoldShared = 0,
  GoldShareUpgrade = 0,
  GoldMaximumBonus = 30,
  LocalGoldGiven = 0,
  LocalGoldBonus = 0
}
OrderMeleeMinionInfo = {
  MinionName = "SRU_OrderMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
ChaosMeleeMinionInfo = {
  MinionName = "SRU_ChaosMinionMelee",
  DefaultInfo = MeleeDefaultMinionInfo
}
OrderCasterMinionInfo = {
  MinionName = "SRU_OrderMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
ChaosCasterMinionInfo = {
  MinionName = "SRU_ChaosMinionRanged",
  DefaultInfo = CasterDefaultMinionInfo
}
OrderCannonMinionInfo = {
  MinionName = "SRU_OrderMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
ChaosCannonMinionInfo = {
  MinionName = "SRU_ChaosMinionSiege",
  DefaultInfo = CannonDefaultMinionInfo
}
OrderSuperMinionInfo = {
  MinionName = "SRU_OrderMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
ChaosSuperMinionInfo = {
  MinionName = "SRU_ChaosMinionSuper",
  DefaultInfo = SuperDefaultMinionInfo
}
DefaultBarrackInfo = {
  IsDestroyed = false,
  NumOfSpawnDisables = 0,
  WillSpawnSuperMinion = 0,
  SpawnOrderMinionNames = {
    "Super",
    "Melee",
    "Cannon",
    "Caster"
  }
}
DefaultOrderMinionInfoTable = {
  Melee = OrderMeleeMinionInfo,
  Caster = OrderCasterMinionInfo,
  Cannon = OrderCannonMinionInfo,
  Super = OrderSuperMinionInfo
}
DefaultChaosMinionInfoTable = {
  Melee = ChaosMeleeMinionInfo,
  Caster = ChaosCasterMinionInfo,
  Cannon = ChaosCannonMinionInfo,
  Super = ChaosSuperMinionInfo
}
OrderBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
OrderBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
ChaosBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
ChaosBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
function AppendTable(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  if A1_1 ~= nil then
    L4_4 = type
    L5_5 = A1_1
    L4_4 = L4_4(L5_5)
    if L4_4 == "table" then
      L4_4, L5_5 = nil, nil
      if A0_0 == nil then
        A0_0 = L6_6
      end
      for L9_9, L10_10 in L6_6(L7_7) do
        if A2_2 == true and type(L10_10) == "table" then
          A0_0[L9_9] = AppendTable(A0_0[L9_9], L10_10, A3_3, A3_3)
        else
          A0_0[L9_9] = L10_10
        end
      end
    end
  end
  return A0_0
end
function InitBarrackInfo(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
  L1_12 = AppendTable
  L2_13 = A0_11
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11 = L1_12
  L1_12 = AppendTable
  L2_13 = A0_11.MinionInfoTable
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16)
  A0_11.MinionInfoTable = L1_12
  L1_12 = A0_11.MinionInfoTable
  if L1_12 ~= nil then
    L1_12 = A0_11.MinionInfoTable
    L2_13 = nil
    for L7_18, L8_19 in L4_15(L5_16) do
      L9_20 = L1_12[L7_18]
      if L9_20.DefaultInfo ~= nil then
        AppendTable(L9_20, L9_20.DefaultInfo, true, true)
        L9_20.NumPerWave = L9_20.DefaultNumPerWave
        L9_20.GoldGivenBase = L9_20.GoldGiven
        L9_20.ExpGivenBase = L9_20.ExpGiven
      end
    end
  end
  L1_12 = A0_11.Overrides
  if L1_12 ~= nil then
    L1_12, L2_13 = nil, nil
    for L6_17, L7_18 in L3_14(L4_15) do
      L8_19 = type
      L9_20 = A0_11[L6_17]
      L8_19 = L8_19(L9_20)
      if L8_19 == "table" then
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 == "table" then
          L8_19 = AppendTable
          L9_20 = A0_11[L6_17]
          L8_19(L9_20, L7_18, true, true)
        end
      else
        L8_19 = type
        L9_20 = L7_18
        L8_19 = L8_19(L9_20)
        if L8_19 ~= "table" then
          A0_11[L6_17] = L7_18
        end
      end
    end
  end
  return A0_11
end
OrderBarracksBonuses = {
  InitBarrackInfo(OrderBarrack0),
  InitBarrackInfo(OrderBarrack1),
  InitBarrackInfo(OrderBarrack2)
}
ChaosBarracksBonuses = {
  InitBarrackInfo(ChaosBarrack0),
  InitBarrackInfo(ChaosBarrack1),
  InitBarrackInfo(ChaosBarrack2)
}
NeutralMinionNames = {
  "SRU_Dragon",
  "SRU_Krug",
  "SRU_KrugMini",
  "SRU_Red",
  "SRU_RedMini",
  "SRU_Razorbeak",
  "SRU_RazorbeakMini",
  "SRU_Murkwolf",
  "SRU_MurkwolfMini",
  "SRU_Blue",
  "SRU_BlueMini",
  "SRU_Gromp",
  "SRU_Baron"
}
function CreateLaneBuildingTable()
  local L0_21, L1_22
  L0_21 = {}
  L0_21.Turret3 = true
  L0_21.Turret2 = true
  L0_21.Turret1 = true
  L0_21.Barracks = true
  return L0_21
end
OrderBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
ChaosBuildingStatus = {
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  CreateLaneBuildingTable(),
  HQTower2 = true,
  HQTower1 = true,
  HQ = true
}
TotalNumberOfMinions = 0
totalNumberOfChaosBarracks = 3
totalNumberOfOrderBarracks = 3
function PreloadBarrackCharacters(A0_23)
  local L1_24, L2_25
  for _FORV_6_, _FORV_7_ in pairs(A0_23.DefaultMinionInfoTable) do
    if _FORV_7_.PreloadedCharacter == nil then
      _FORV_7_.PreloadedCharacter = 1
      PreloadCharacter(_FORV_7_.MinionName)
    end
  end
end
function SuppressMinionSpawnForBarrack(A0_26)
  for _FORV_4_, _FORV_5_ in pairs(DefaultBarrackInfo.SpawnOrderMinionNames) do
    A0_26.MinionInfoTable[_FORV_5_].NumPerWave = 0
  end
end
function SetMutatorGlobals()
  if GetMutatorParameterBool("UsePoolPartyMinions") then
    PreloadCharacter("SRU_OrderMinionMelee_PoolParty")
    PreloadCharacter("SRU_OrderMinionRanged_PoolParty")
    PreloadCharacter("SRU_OrderMinionSiege_PoolParty")
    PreloadCharacter("SRU_ChaosMinionMelee_PoolParty")
    PreloadCharacter("SRU_ChaosMinionRanged_PoolParty")
    PreloadCharacter("SRU_ChaosMinionSiege_PoolParty")
    OrderMeleePoolPartyMinionInfo = {
      MinionName = "SRU_OrderMinionMelee_PoolParty",
      DefaultInfo = MeleeDefaultMinionInfo
    }
    OrderCasterPoolPartyMinionInfo = {
      MinionName = "SRU_OrderMinionRanged_PoolParty",
      DefaultInfo = CasterDefaultMinionInfo
    }
    OrderCannonPoolPartyMinionInfo = {
      MinionName = "SRU_OrderMinionSiege_PoolParty",
      DefaultInfo = CannonDefaultMinionInfo
    }
    ChaosMeleePoolPartyMinionInfo = {
      MinionName = "SRU_ChaosMinionMelee_PoolParty",
      DefaultInfo = MeleeDefaultMinionInfo
    }
    ChaosCasterPoolPartyMinionInfo = {
      MinionName = "SRU_ChaosMinionRanged_PoolParty",
      DefaultInfo = CasterDefaultMinionInfo
    }
    ChaosCannonPoolPartyMinionInfo = {
      MinionName = "SRU_ChaosMinionSiege_PoolParty",
      DefaultInfo = CannonDefaultMinionInfo
    }
    DefaultOrderMinionInfoTable = {
      Melee = OrderMeleePoolPartyMinionInfo,
      Caster = OrderCasterPoolPartyMinionInfo,
      Cannon = OrderCannonPoolPartyMinionInfo,
      Super = OrderSuperMinionInfo
    }
    DefaultChaosMinionInfoTable = {
      Melee = ChaosMeleePoolPartyMinionInfo,
      Caster = ChaosCasterPoolPartyMinionInfo,
      Cannon = ChaosCannonPoolPartyMinionInfo,
      Super = ChaosSuperMinionInfo
    }
    OrderBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
    OrderBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
    OrderBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultOrderMinionInfoTable}
    ChaosBarrack0 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
    ChaosBarrack1 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
    ChaosBarrack2 = {DefaultInfo = DefaultBarrackInfo, DefaultMinionInfoTable = DefaultChaosMinionInfoTable}
    OrderBarracksBonuses = {
      InitBarrackInfo(OrderBarrack0),
      InitBarrackInfo(OrderBarrack1),
      InitBarrackInfo(OrderBarrack2)
    }
    ChaosBarracksBonuses = {
      InitBarrackInfo(ChaosBarrack0),
      InitBarrackInfo(ChaosBarrack1),
      InitBarrackInfo(ChaosBarrack2)
    }
  end
end
function OnLevelInit()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32, L6_33
  for L5_32, L6_33 in L2_29(L3_30) do
    PreloadBarrackCharacters(L6_33)
  end
  for L5_32, L6_33 in L2_29(L3_30) do
    PreloadBarrackCharacters(L6_33)
  end
  L2_29()
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L2_29(L3_30)
  L6_33 = L3_30()
  L2_29(L3_30, L4_31, L5_32, L6_33, L3_30())
  L2_29(L3_30)
  L2_29()
  L2_29(L3_30)
end
function OnLevelInitServer()
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
  InitTimer("IncreaseCannonMinionSpawnRate", INCREASE_CANNON_RATE_TIMER, false)
  InitTimer("IncreaseCannonMinionSpawnRateAgain", INCREASE_CANNON_RATE_TIMER2, false)
  InitTimer("AllowDamageOnBuildings", 10, false)
end
function OnPostLevelLoad()
  local L0_34, L1_35, L2_36, L3_37, L4_38
  L0_34(L1_35)
  L0_34()
  for L3_37 = RIGHT_LANE, LEFT_LANE do
    L4_38 = GetDampener
    L4_38 = L4_38(TEAM_ORDER, L3_37)
    SetDampenerRespawnAnimationDuration(L4_38, ORDER_INHIBITOR_RESPAWN_ANIMATION_DURATION)
    L4_38 = GetDampener(TEAM_CHAOS, L3_37)
    SetDampenerRespawnAnimationDuration(L4_38, CHAOS_INHIBITOR_RESPAWN_ANIMATION_DURATION)
    SetLaneExposed(TEAM_ORDER, L3_37, false)
    SetLaneExposed(TEAM_CHAOS, L3_37, false)
    SetLaneTowerCount(TEAM_ORDER, L3_37, 3)
    SetLaneTowerCount(TEAM_CHAOS, L3_37, 3)
  end
  L0_34(L1_35)
  L0_34(L1_35)
  L0_34(L1_35, L2_36)
  L0_34(L1_35, L2_36)
  L0_34(L1_35, L2_36)
end
function OnGameStartup()
  local L0_39
  L0_39 = 0
  OrderHQPos = GetKeyLocation(L0_39, TEAM_ORDER)
  ChaosHQPos = GetKeyLocation(L0_39, TEAM_CHAOS)
end
function SetShieldBuffsOnSecondaryTurrets(A0_40)
  local L1_41, L2_42, L3_43, L4_44
  for L4_44 = RIGHT_LANE, LEFT_LANE do
    if L4_44 ~= CENTER_LANE then
      innerTurret = GetTurret(A0_40, L4_44, MIDDLE_TOWER)
      ApplyPersistentBuff(innerTurret, "SRTurretSecondaryShielder", false, 1, 1)
      AddBuffCounter(innerTurret, "SRTurretSecondaryShielder", L4_44, 2)
    end
  end
end
SPELLBOOK_SUMMONER = 1
function ApplyJungleTracker(A0_45)
  if GetSlotSpellName(A0_45, 0, SPELLBOOK_SUMMONER, 0) == "summonersmite" or GetSlotSpellName(A0_45, 1, SPELLBOOK_SUMMONER, 0) == "summonersmite" then
    ApplyPersistentBuff(A0_45, "ItemJungleStatsTracker", true, 1, 1)
  end
end
function ApplyBaseBuffToAllChampions()
  LuaForEachChampion(TEAM_CHAOS, "ApplyBaseBuffChaos")
  LuaForEachChampion(TEAM_ORDER, "ApplyBaseBuffOrder")
end
function ApplyBaseBuffChaos(A0_46)
  ApplyBaseBuff(A0_46, ChaosHQPos)
end
function ApplyBaseBuffOrder(A0_47)
  ApplyBaseBuff(A0_47, OrderHQPos)
end
baseBuffRadiusSquared = 12250000
BUFF_Aura = 1
function ApplyBaseBuff(A0_48, A1_49)
  if (GetPosition(A0_48) - A1_49):lengthSq() < baseBuffRadiusSquared then
    SpellBuffAdd(A0_48, A0_48, "S5Test_BaseBuff", BUFF_Aura, 1, 0.5, nil)
  end
end
function OppositeTeam(A0_50)
  if A0_50 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimer()
  local L0_51, L1_52, L2_53, L3_54, L4_55, L5_56, L6_57, L7_58, L8_59, L9_60, L10_61, L11_62
  UpgradedMinionIterations = L1_52
  L1_52(L2_53, L3_54)
  for L4_55 = 1, 2 do
    if L4_55 == 1 then
      L0_51 = OrderBarracksBonuses
    else
      L0_51 = ChaosBarracksBonuses
    end
    for L8_59 = 1, 3 do
      L9_60, L10_61 = nil, nil
      L11_62 = L0_51[L8_59]
      L11_62 = L11_62.MinionInfoTable
      for _FORV_15_, _FORV_16_ in pairs(L11_62) do
        if UpgradedMinionIterations >= UPGRADE_MINION_ITERATIONS_FOR_LATE_SCALING then
        end
        _FORV_16_.HPBonus = _FORV_16_.HPBonus + (_FORV_16_.HPUpgrade + _FORV_16_.HPUpgradeLate)
        _FORV_16_.HPUpgrade = _FORV_16_.HPUpgrade + (_FORV_16_.HPUpgradeGrowth + _FORV_16_.HPUpgradeGrowthLate)
        _FORV_16_.DamageBonus = _FORV_16_.DamageBonus + _FORV_16_.DamageUpgrade
        _FORV_16_.GoldBonus = _FORV_16_.GoldBonus + _FORV_16_.GoldUpgrade
        if _FORV_16_.GoldBonus > _FORV_16_.GoldMaximumBonus then
          _FORV_16_.GoldBonus = _FORV_16_.GoldMaximumBonus
        end
        _FORV_16_.LocalGoldBonus = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShareUpgrade
        _FORV_16_.Armor = _FORV_16_.Armor
        _FORV_16_.MagicResistance = _FORV_16_.MagicResistance
        _FORV_16_.ExpBonus = _FORV_16_.ExpBonus + _FORV_16_.ExpUpgrade
        _FORV_16_.GoldGiven = _FORV_16_.GoldBonus + _FORV_16_.GoldGivenBase
        _FORV_16_.LocalGoldGiven = _FORV_16_.LocalGoldBonus + _FORV_16_.GoldShared
        _FORV_16_.ExpGiven = _FORV_16_.ExpBonus + _FORV_16_.ExpGivenBase
      end
    end
  end
end
function AllowDamageOnBuildings()
  local L0_63, L1_64, L2_65, L3_66, L4_67, L5_68, L6_69, L7_70
  for L3_66 = RIGHT_LANE, LEFT_LANE do
    for L7_70 = BACK_TOWER, HQ_TOWER1 do
      orderTurret = GetTurret(TEAM_ORDER, L3_66, L7_70)
      if orderTurret ~= nil then
        if L7_70 == FRONT_TOWER then
          SetInvulnerable(orderTurret, false)
          SetTargetable(orderTurret, true)
        else
          SetInvulnerable(orderTurret, true)
          SetNotTargetableToTeam(orderTurret, true, TEAM_CHAOS)
        end
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L3_66, L7_70)
      if chaosTurret ~= nil then
        if L7_70 == FRONT_TOWER then
          SetInvulnerable(chaosTurret, false)
          SetTargetable(chaosTurret, true)
        else
          SetInvulnerable(chaosTurret, true)
          SetNotTargetableToTeam(chaosTurret, true, TEAM_ORDER)
        end
      end
    end
  end
end
function ResetToDefaultWaveCounts(A0_71)
  local L1_72, L2_73
  for _FORV_6_, _FORV_7_ in pairs(A0_71) do
    _FORV_7_.NumPerWave = _FORV_7_.DefaultNumPerWave
  end
end
function ClearCurrentWaveCounts(A0_74)
  local L1_75, L2_76
  for _FORV_6_, _FORV_7_ in pairs(A0_74) do
    _FORV_7_.NumPerWave = 0
  end
end
function GetInitSpawnInfo(A0_77, A1_78)
  local L2_79, L3_80, L4_81
  L2_79 = 0
  L3_80 = TEAM_ORDER
  if A1_78 == L3_80 then
    L3_80 = OrderBarracksBonuses
    L4_81 = A0_77 + 1
    L2_79 = L3_80[L4_81]
  else
    L3_80 = ChaosBarracksBonuses
    L4_81 = A0_77 + 1
    L2_79 = L3_80[L4_81]
  end
  L3_80 = {}
  L4_81 = SpawnTable
  L4_81 = L4_81.WaveSpawnRate
  L3_80.WaveSpawnRate = L4_81
  L4_81 = SpawnTable
  L4_81 = L4_81.SingleMinionSpawnDelay
  L3_80.SingleMinionSpawnDelay = L4_81
  L4_81 = L2_79.IsDestroyed
  L3_80.IsDestroyed = L4_81
  L4_81 = L2_79.MinionInfoTable
  L3_80.MinionInfoTable = L4_81
  ReturnTable = L3_80
  L3_80 = ReturnTable
  return L3_80
end
function GetMinionSpawnInfo(A0_82, A1_83, A2_84, A3_85, A4_86)
  local L5_87, L6_88, L7_89
  L5_87 = 0
  L6_88 = TEAM_ORDER
  if A3_85 == L6_88 then
    L6_88 = OrderBarracksBonuses
    L7_89 = A0_82 + 1
    L5_87 = L6_88[L7_89]
  else
    L6_88 = ChaosBarracksBonuses
    L7_89 = A0_82 + 1
    L5_87 = L6_88[L7_89]
  end
  L6_88 = L5_87.MinionInfoTable
  L6_88 = L6_88.Super
  L7_89 = L5_87.MinionInfoTable
  L7_89 = L7_89.Cannon
  ResetToDefaultWaveCounts(L5_87.MinionInfoTable)
  if A1_83 % CANNON_MINION_SPAWN_FREQUENCY == 0 then
    L7_89.NumPerWave = L7_89.NumPerWave + 1
  end
  if A4_86 ~= LAST_WAVE then
    BARRACKSCOUNT = 6
    totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()
    if totalMinionsRemaining <= BARRACKSCOUNT * 7 then
      if 0 >= totalMinionsRemaining then
        SPECIAL_MINION_MODE = "None"
      elseif totalMinionsRemaining >= BARRACKSCOUNT then
        SPECIAL_MINION_MODE = "2MeleeMinions"
      else
        SPECIAL_MINION_MODE = "None"
      end
    else
      SPECIAL_MINION_MODE = ""
    end
    LAST_WAVE = A4_86
  end
  if L5_87.WillSpawnSuperMinion == 1 then
    if A3_85 == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or A3_85 == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      L6_88.NumPerWave = 2
    else
      L6_88.NumPerWave = 1
    end
    L7_89.NumPerWave = 0
  end
  if SPECIAL_MINION_MODE == "2MeleeMinions" then
    ClearCurrentWaveCounts(L5_87.MinionInfoTable)
    L6_88.NumPerWave = L5_87.MinionInfoTable.Super.NumPerWave
    L5_87.MinionInfoTable.Melee.NumPerWave = math.max(2 - L5_87.MinionInfoTable.Super.NumPerWave, 0)
  elseif SPECIAL_MINION_MODE == "None" then
    ClearCurrentWaveCounts(L5_87.MinionInfoTable)
  end
  if GetMutatorParameterBool("SuppressMinionSpawn") then
    SuppressMinionSpawnForBarrack(L5_87)
  end
  ReturnTable = {
    NewFormat = true,
    SpawnOrderMinionNames = L5_87.SpawnOrderMinionNames,
    IsDestroyed = L5_87.IsDestroyed,
    ExperienceRadius = SpawnTable.ExpRadius,
    GoldRadius = SpawnTable.GoldRadius,
    MinionInfoTable = L5_87.MinionInfoTable
  }
  return ReturnTable
end
function DeactivateCorrectStructure(A0_90, A1_91, A2_92)
  local L3_93, L4_94
  L4_94 = TEAM_ORDER
  if A0_90 == L4_94 then
    L3_93 = OrderBuildingStatus
  else
    L3_93 = ChaosBuildingStatus
  end
  L4_94 = FRONT_TOWER
  if A2_92 == L4_94 then
    L4_94 = A1_91 + 1
    L4_94 = L3_93[L4_94]
    L4_94.Turret3 = false
    L4_94 = GetTurret
    L4_94 = L4_94(A0_90, A1_91, MIDDLE_TOWER)
    SetInvulnerable(L4_94, false)
    SetTargetable(L4_94, true)
    SetLaneTowerCount(A0_90, A1_91, 2)
  else
    L4_94 = MIDDLE_TOWER
    if A2_92 == L4_94 then
      L4_94 = A1_91 + 1
      L4_94 = L3_93[L4_94]
      L4_94.Turret2 = false
      L4_94 = GetTurret
      L4_94 = L4_94(A0_90, A1_91, BACK_TOWER)
      SetInvulnerable(L4_94, false)
      SetTargetable(L4_94, true)
      SetLaneTowerCount(A0_90, A1_91, 1)
    else
      L4_94 = BACK_TOWER
      if A2_92 == L4_94 then
        L4_94 = A1_91 + 1
        L4_94 = L3_93[L4_94]
        L4_94.Turret1 = false
        L4_94 = GetDampener
        L4_94 = L4_94(A0_90, A1_91)
        SetInvulnerable(L4_94, false)
        SetTargetable(L4_94, true)
        SetLaneTowerCount(A0_90, A1_91, 0)
      else
        L4_94 = HQ_TOWER2
        if A2_92 == L4_94 then
          L3_93.HQTower2 = false
          L4_94 = L3_93.HQTower1
          if L4_94 == false then
            L4_94 = GetHQ
            L4_94 = L4_94(A0_90)
            SetInvulnerable(L4_94, false)
            SetTargetable(L4_94, true)
          end
        else
          L4_94 = HQ_TOWER1
          if A2_92 == L4_94 then
            L3_93.HQTower1 = false
            L4_94 = L3_93.HQTower2
            if L4_94 == false then
              L4_94 = GetHQ
              L4_94 = L4_94(A0_90)
              SetInvulnerable(L4_94, false)
              SetTargetable(L4_94, true)
            end
          end
        end
      end
    end
  end
end
function GetLuaBarracks(A0_95, A1_96)
  local L2_97, L3_98, L4_99
  L3_98 = TEAM_ORDER
  if A0_95 == L3_98 then
    L3_98 = OrderBarracksBonuses
    L4_99 = A1_96 + 1
    L2_97 = L3_98[L4_99]
  else
    L3_98 = ChaosBarracksBonuses
    L4_99 = A1_96 + 1
    L2_97 = L3_98[L4_99]
  end
  return L2_97
end
function GetDisableMinionSpawnTime(A0_100, A1_101)
  barrack = GetLuaBarracks(A1_101, A0_100)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_102, A1_103)
  cLangBarracks = GetBarracks(A1_103, A0_102)
  luaBarrack = GetLuaBarracks(A1_103, A0_102)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_102, A1_103))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_104, A1_105)
  local L2_106, L3_107, L4_108, L5_109, L6_110, L7_111, L8_112, L9_113, L10_114
  BonusesCounter = L2_106
  for L5_109 = 1, 3 do
    L6_110, L7_111 = nil, nil
    L8_112 = TEAM_ORDER
    if A0_104 == L8_112 then
      L7_111 = TEAM_CHAOS
      L6_110 = OrderBarracksBonuses
      L8_112 = ChaosBarracksBonuses
      EnemyBarracks = L8_112
    else
      L7_111 = TEAM_ORDER
      L6_110 = ChaosBarracksBonuses
      L8_112 = OrderBarracksBonuses
      EnemyBarracks = L8_112
    end
    L8_112, L9_113 = nil, nil
    L10_114 = L6_110[L5_109]
    L10_114 = L10_114.MinionInfoTable
    for _FORV_14_, _FORV_15_ in pairs(L10_114) do
      _FORV_15_.HPBonus = _FORV_15_.HPBonus + _FORV_15_.HPInhibitor
      _FORV_15_.DamageBonus = _FORV_15_.DamageBonus + _FORV_15_.DamageInhibitor
      _FORV_15_.ExpGiven = _FORV_15_.ExpGiven - _FORV_15_.ExpInhibitor
      _FORV_15_.GoldGiven = _FORV_15_.GoldGiven - _FORV_15_.GoldInhibitor
    end
    if L5_109 == A1_105 + 1 then
      L6_110[L5_109].WillSpawnSuperMinion = 1
      if A0_104 == TEAM_ORDER then
        totalNumberOfChaosBarracks = totalNumberOfChaosBarracks - 1
      else
        totalNumberOfOrderBarracks = totalNumberOfOrderBarracks - 1
      end
    end
  end
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(A0_115, A1_116)
  local L2_117, L3_118, L4_119, L5_120, L6_121, L7_122, L8_123, L9_124, L10_125, L11_126, L12_127, L13_128, L14_129, L15_130, L16_131, L17_132, L18_133
  ReductionCounter = L2_117
  for L5_120 = 1, 3 do
    L6_121, L7_122, L8_123 = nil, nil, nil
    L9_124 = TEAM_ORDER
    if A0_115 == L9_124 then
      L8_123 = TEAM_CHAOS
      L6_121 = OrderBarracksBonuses
      L7_122 = ChaosBarracksBonuses
    else
      L8_123 = TEAM_ORDER
      L6_121 = ChaosBarracksBonuses
      L7_122 = OrderBarracksBonuses
    end
    L9_124, L10_125 = nil, nil
    L11_126 = L6_121[L5_120]
    L11_126 = L11_126.MinionInfoTable
    for L15_130, L16_131 in L12_127(L13_128) do
      L17_132 = L16_131.HPBonus
      L18_133 = L16_131.HPInhibitor
      L17_132 = L17_132 - L18_133
      L16_131.HPBonus = L17_132
      L17_132 = L16_131.DamageBonus
      L18_133 = L16_131.DamageInhibitor
      L17_132 = L17_132 - L18_133
      L16_131.DamageBonus = L17_132
      L17_132 = L16_131.ExpGiven
      L18_133 = L16_131.ExpInhibitor
      L17_132 = L17_132 + L18_133
      L16_131.ExpGiven = L17_132
      L17_132 = L16_131.GoldGiven
      L18_133 = L16_131.GoldInhibitor
      L17_132 = L17_132 + L18_133
      L16_131.GoldGiven = L17_132
    end
    if L5_120 == L13_128 then
      if A0_115 == L13_128 then
        totalNumberOfChaosBarracks = L13_128
      else
        totalNumberOfOrderBarracks = L13_128
      end
      L13_128.WillSpawnSuperMinion = 0
      L16_131 = false
      L13_128(L14_129, L15_130, L16_131)
    end
    if L12_127 == 3 then
      HQ = L13_128
      L13_128(L14_129, L15_130)
      L13_128(L14_129, L15_130)
      for L16_131 = RIGHT_LANE, LEFT_LANE do
        L17_132 = GetTurret
        L18_133 = L8_123
        L17_132 = L17_132(L18_133, L16_131, HQ_TOWER1)
        L18_133 = GetTurret
        L18_133 = L18_133(L8_123, L16_131, HQ_TOWER2)
        if L17_132 ~= Nil then
          SetInvulnerable(L17_132, true)
          SetNotTargetableToTeam(L17_132, true, A0_115)
        end
        if L18_133 ~= Nil then
          SetInvulnerable(L18_133, true)
          SetNotTargetableToTeam(L18_133, true, A0_115)
        end
      end
    end
  end
end
ReactiveCounter = 0
function BarrackReactiveEvent(A0_134, A1_135)
  local L2_136
  ReactiveCounter = ReactiveCounter + 1
  L2_136 = OppositeTeam(A0_134)
  dampener = GetDampener(A0_134, A1_135)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(L2_136, A1_135)
end
function DisableSuperMinions(A0_137, A1_138)
  local L2_139, L3_140
  if A0_137 == TEAM_ORDER then
    L2_139 = OrderBarracksBonuses[A1_138 + 1]
    L3_140 = ChaosBarracksBonuses[A1_138 + 1]
  elseif A0_137 == TEAM_CHAOS then
    L2_139 = ChaosBarracksBonuses[A1_138 + 1]
    L3_140 = OrderBarracksBonuses[A1_138 + 1]
  end
  if L3_140 then
    L3_140.WillSpawnSuperMinion = 0
  end
end
function OnJumpToMidGameCheat(A0_141)
  local L1_142
  L1_142 = GetTurret
  L1_142 = L1_142(TEAM_ORDER, 1, HQ_TOWER1)
  if A0_141 == 0 then
    ApplyPersistentBuff(L1_142, "DebugMidGameBuff", false, 1, 1)
  else
    ApplyPersistentBuff(L1_142, "DebugLateGameBuff", false, 1, 1)
  end
end
function OnBarracksToggled(A0_143)
  local L1_144
  if A0_143 == 0 then
  end
end
DisactivatedCounter = 0
function HandleDestroyedObject(A0_145)
  local L1_146, L2_147, L3_148
  L1_146 = GetHQType
  L2_147 = A0_145
  L1_146 = L1_146(L2_147)
  HQType = L1_146
  L1_146 = HQType
  L2_147 = ORDER_HQ
  if L1_146 ~= L2_147 then
    L1_146 = HQType
    L2_147 = CHAOS_HQ
  elseif L1_146 == L2_147 then
    L1_146 = HQType
    L2_147 = CHAOS_HQ
    if L1_146 == L2_147 then
      L1_146 = EndOfGameCeremony
      L2_147 = TEAM_ORDER
      L3_148 = A0_145
      L1_146(L2_147, L3_148)
    else
      L1_146 = EndOfGameCeremony
      L2_147 = TEAM_CHAOS
      L3_148 = A0_145
      L1_146(L2_147, L3_148)
    end
    return
  end
  L1_146 = IsDampener
  L2_147 = A0_145
  L1_146 = L1_146(L2_147)
  if L1_146 then
    L1_146 = GetLinkedBarrack
    L2_147 = A0_145
    L1_146 = L1_146(L2_147)
    barrack = L1_146
    L1_146 = GetTeamID
    L2_147 = barrack
    L1_146 = L1_146(L2_147)
    barrackTeam = L1_146
    L1_146 = GetLane
    L2_147 = A0_145
    L1_146 = L1_146(L2_147)
    barrackLane = L1_146
    L1_146 = SetLaneExposed
    L2_147 = barrackTeam
    L3_148 = barrackLane
    L1_146(L2_147, L3_148, true)
    L1_146 = DisableBarracksSpawn
    L2_147 = barrackLane
    L3_148 = barrackTeam
    L1_146(L2_147, L3_148)
    L1_146 = SetDampenerState
    L2_147 = A0_145
    L3_148 = DampenerRegenerationState
    L1_146(L2_147, L3_148)
    L1_146 = SetInvulnerable
    L2_147 = A0_145
    L3_148 = true
    L1_146(L2_147, L3_148)
    L1_146 = SetTargetable
    L2_147 = A0_145
    L3_148 = false
    L1_146(L2_147, L3_148)
    L1_146 = DisactivatedCounter
    L1_146 = L1_146 + 1
    DisactivatedCounter = L1_146
    L1_146 = GetTurret
    L2_147 = barrackTeam
    L3_148 = 1
    L1_146 = L1_146(L2_147, L3_148, HQ_TOWER1)
    L2_147 = GetTurret
    L3_148 = barrackTeam
    L2_147 = L2_147(L3_148, 1, HQ_TOWER2)
    L3_148 = Nil
    if L1_146 ~= L3_148 then
      L3_148 = SetInvulnerable
      L3_148(L1_146, false)
      L3_148 = SetTargetable
      L3_148(L1_146, true)
    end
    L3_148 = Nil
    if L2_147 ~= L3_148 then
      L3_148 = SetInvulnerable
      L3_148(L2_147, false)
      L3_148 = SetTargetable
      L3_148(L2_147, true)
    end
    L3_148 = Nil
    if L1_146 == L3_148 then
      L3_148 = Nil
      if L2_147 == L3_148 then
        L3_148 = GetHQ
        L3_148 = L3_148(barrackTeam)
        SetInvulnerable(L3_148, false)
        SetTargetable(L3_148, true)
      end
    end
    L3_148 = nil
    if barrackTeam == TEAM_CHAOS then
      L3_148 = TEAM_ORDER
    else
      L3_148 = TEAM_CHAOS
    end
    ApplyBarracksDestructionBonuses(L3_148, barrackLane)
  end
  L1_146 = IsTurretAI
  L2_147 = A0_145
  L1_146 = L1_146(L2_147)
  if L1_146 then
    L1_146 = GetTeamID
    L2_147 = A0_145
    L1_146 = L1_146(L2_147)
    L2_147 = GetObjectLaneId
    L3_148 = A0_145
    L2_147 = L2_147(L3_148)
    L3_148 = GetTurretPosition
    L3_148 = L3_148(A0_145)
    DeactivateCorrectStructure(L1_146, L2_147, L3_148)
    return
  end
  L1_146 = GetDampenerType
  L2_147 = A0_145
  L1_146 = L1_146(L2_147)
  if L1_146 > -1 then
    L2_147 = 0
    L3_148 = TEAM_ORDER
    if L1_146 % TEAM_CHAOS >= RIGHT_LANE and L1_146 % TEAM_CHAOS <= LEFT_LANE then
      L2_147 = ChaosBarracksBonuses[L1_146 % TEAM_CHAOS + 1]
      ChaosBuildingStatus[L1_146 % TEAM_CHAOS + 1].Barracks = false
    else
      L3_148 = TEAM_CHAOS
      L2_147 = OrderBarracksBonuses[L1_146 % TEAM_CHAOS - TEAM_ORDER + 1]
      OrderBuildingStatus[L1_146 % TEAM_CHAOS - TEAM_ORDER + 1].Barracks = false
    end
  else
    L2_147 = Log
    L3_148 = "Could not find Linking barracks!"
    L2_147(L3_148)
  end
  L2_147 = true
  return L2_147
end
function SetLaneExposed(A0_149, A1_150, A2_151)
  if A0_149 == TEAM_ORDER then
    if A1_150 == LEFT_LANE then
      SetWorldVar("OrderTopLaneExposed", A2_151)
    elseif A1_150 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneExposed", A2_151)
    else
      SetWorldVar("OrderMidLaneExposed", A2_151)
    end
  elseif A1_150 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneExposed", A2_151)
  elseif A1_150 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneExposed", A2_151)
  else
    SetWorldVar("ChaosMidLaneExposed", A2_151)
  end
end
function SetLaneTowerCount(A0_152, A1_153, A2_154)
  if A0_152 == TEAM_ORDER then
    if A1_153 == LEFT_LANE then
      SetWorldVar("OrderTopLaneTowerCount", A2_154)
    elseif A1_153 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneTowerCount", A2_154)
    else
      SetWorldVar("OrderMidLaneTowerCount", A2_154)
    end
  elseif A1_153 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneTowerCount", A2_154)
  elseif A1_153 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneTowerCount", A2_154)
  else
    SetWorldVar("ChaosMidLaneTowerCount", A2_154)
  end
end
function IncreaseCannonMinionSpawnRate()
  local L1_155
  L1_155 = 2
  CANNON_MINION_SPAWN_FREQUENCY = L1_155
end
function IncreaseCannonMinionSpawnRateAgain()
  local L1_156
  L1_156 = 1
  CANNON_MINION_SPAWN_FREQUENCY = L1_156
end
function PostGameSetup(A0_157)
  POST_GAME_EVENTS = {}
end
function PostGameUpdate(A0_158, A1_159)
  local L2_160, L3_161, L4_162, L5_163, L6_164, L7_165
  for L7_165, _FORV_8_ in L4_162(L5_163) do
    if A0_158 > _FORV_8_.delay then
      ClientSide_CameraMoveCameraFromCurrentPositionToPoint(_FORV_8_.cameraLocation, _FORV_8_.travelTime)
      if _FORV_8_.soundFile then
        ClientSide_PlaySoundFile(_FORV_8_.soundFile)
      end
      table.remove(POST_GAME_EVENTS, L7_165)
      break
    end
  end
end
