DoLuaShared("GlobalLevelScript")
EVENT_STAGE_WELCOME_TIME = 30
EVENT_STAGE_PREANNOUNCE_TIME = 45
EVENT_STAGE_MINIONS_SPAWNED_TIME = 75
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
INITIAL_TIME_TO_SPAWN = 75
CANNON_MINION_SPAWN_FREQUENCY = 3
INCREASE_CANNON_RATE_TIMER = 1200
INCREASE_CANNON_RATE_TIMER2 = 2100
MINION_HEALTH_DENIAL_PERCENT = 0
SMITE_CHARGE_START = 90
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
  GoldGiven = 19.875,
  GoldBonus = 0,
  GoldUpgrade = 0.125,
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
  GoldGiven = 16.875,
  GoldBonus = 0,
  GoldUpgrade = 0.125,
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
  GoldGiven = 44.65,
  GoldBonus = 0,
  GoldUpgrade = 0.35,
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
  GoldGiven = 44.65,
  GoldBonus = 0,
  GoldUpgrade = 0.35,
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
BASE_AMBIENT_GOLD = 10.2
dynamicAmbientGold = 4
DYNAMIC_AMBIENT_GOLD_INCREASE_PER_10 = 0.017
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
  local L0_27, L1_28
end
function OnLevelInit()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35
  for L5_34, L6_35 in L2_31(L3_32) do
    PreloadBarrackCharacters(L6_35)
  end
  for L5_34, L6_35 in L2_31(L3_32) do
    PreloadBarrackCharacters(L6_35)
  end
  L2_31()
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L2_31(L3_32)
  L6_35 = L3_32()
  L2_31(L3_32, L4_33, L5_34, L6_35, L3_32())
  L3_32(L4_33)
  L3_32()
  L3_32(L4_33)
end
function OnLevelInitServer()
  InitTimer("UpgradeMinionTimerInitial", INITIAL_TIME_TO_SPAWN, false)
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
  InitTimer("IncreaseCannonMinionSpawnRate", INCREASE_CANNON_RATE_TIMER, false)
  InitTimer("IncreaseCannonMinionSpawnRateAgain", INCREASE_CANNON_RATE_TIMER2, false)
  InitTimer("AllowDamageOnBuildings", 10, false)
  InitTimer("InitialUpdateAmbientGold", 720, false)
end
function OnPostLevelLoad()
  local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47
  L0_36 = GetMutatorParameterString
  L0_36 = L0_36(L1_37)
  L1_37(L2_38)
  L1_37()
  for L4_40 = RIGHT_LANE, LEFT_LANE do
    L5_41 = GetDampener
    L6_42 = TEAM_ORDER
    L7_43 = L4_40
    L5_41 = L5_41(L6_42, L7_43)
    L6_42 = SetDampenerRespawnAnimationDuration
    L7_43 = L5_41
    L6_42(L7_43, L8_44)
    L6_42 = GetDampener
    L7_43 = TEAM_CHAOS
    L6_42 = L6_42(L7_43, L8_44)
    L5_41 = L6_42
    L6_42 = SetDampenerRespawnAnimationDuration
    L7_43 = L5_41
    L6_42(L7_43, L8_44)
    L6_42 = SetLaneExposed
    L7_43 = TEAM_ORDER
    L6_42(L7_43, L8_44, L9_45)
    L6_42 = SetLaneExposed
    L7_43 = TEAM_CHAOS
    L6_42(L7_43, L8_44, L9_45)
    L6_42 = 0
    L7_43 = 0
    for L11_47 = BACK_TOWER, FRONT_TOWER do
      orderTurret = GetTurret(TEAM_ORDER, L4_40, L11_47)
      if orderTurret ~= nil then
        L6_42 = L6_42 + 1
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L4_40, L11_47)
      if chaosTurret ~= nil then
        L7_43 = L7_43 + 1
      end
    end
    L11_47 = L6_42
    L8_44(L9_45, L10_46, L11_47)
    L11_47 = L7_43
    L8_44(L9_45, L10_46, L11_47)
  end
  L1_37(L2_38, L3_39)
  L1_37(L2_38, L3_39)
  L1_37(L2_38, L3_39)
  L1_37(L2_38, L3_39)
end
function OnLevelReset()
  local L0_48
  L0_48 = OnPostLevelLoad
  L0_48()
  L0_48 = InitTimer
  L0_48("AllowDamageOnBuildings", 10, false)
  L0_48 = GetHQ
  L0_48 = L0_48(TEAM_ORDER)
  SetInvulnerable(L0_48, true)
  SetTargetable(L0_48, false)
  L0_48 = GetHQ(TEAM_CHAOS)
  SetInvulnerable(L0_48, true)
  SetTargetable(L0_48, false)
end
function OnGameStartup()
  local L0_49
  L0_49 = LuaForEachChampion
  L0_49(TEAM_UNKNOWN, "ApplySRBuffs")
  L0_49 = LuaForEachChampion
  L0_49(TEAM_UNKNOWN, "ApplyBountyTrackerBuff")
  L0_49 = 0
  OrderHQPos = GetKeyLocation(L0_49, TEAM_ORDER)
  ChaosHQPos = GetKeyLocation(L0_49, TEAM_CHAOS)
end
function ApplyBountyTrackerBuff(A0_50)
  ApplyPersistentBuff(A0_50, "S6_BountyTracker", false, 1, 1)
end
function ApplySRBuffs(A0_51)
  ApplyPersistentBuff(A0_51, "S6Test_RegionRules", false, 1, 1)
  ApplyPersistentBuff(A0_51, "SRChampionBuff", false, 1, 1)
end
function ApplyBaseBuffToAllChampions()
  LuaForEachChampion(TEAM_CHAOS, "ApplyBaseBuffChaos")
  LuaForEachChampion(TEAM_ORDER, "ApplyBaseBuffOrder")
end
function ApplyBaseBuffChaos(A0_52)
  ApplyBaseBuff(A0_52, ChaosHQPos)
end
function ApplyBaseBuffOrder(A0_53)
  ApplyBaseBuff(A0_53, OrderHQPos)
end
baseBuffRadiusSquared = 12250000
BUFF_Aura = 1
function ApplyBaseBuff(A0_54, A1_55)
  if (GetPosition(A0_54) - A1_55):lengthSq() < baseBuffRadiusSquared then
    SpellBuffAdd(A0_54, A0_54, "S5Test_BaseBuff", BUFF_Aura, 1, 0.5, nil)
  end
end
function OppositeTeam(A0_56)
  if A0_56 == TEAM_CHAOS then
    return TEAM_ORDER
  else
    return TEAM_CHAOS
  end
end
function UpgradeMinionTimerInitial()
  UpgradeMinionTimer()
  InitTimer("UpgradeMinionTimer", UPGRADE_MINION_TIMER, true)
end
function UpgradeMinionTimer()
  local L0_57, L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67, L11_68
  UpgradedMinionIterations = L1_58
  L1_58(L2_59, L3_60)
  for L4_61 = 1, 2 do
    if L4_61 == 1 then
      L0_57 = OrderBarracksBonuses
    else
      L0_57 = ChaosBarracksBonuses
    end
    for L8_65 = 1, 3 do
      L9_66, L10_67 = nil, nil
      L11_68 = L0_57[L8_65]
      L11_68 = L11_68.MinionInfoTable
      for _FORV_15_, _FORV_16_ in pairs(L11_68) do
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
  local L0_69, L1_70, L2_71, L3_72, L4_73, L5_74, L6_75, L7_76, L8_77, L9_78
  for L3_72 = RIGHT_LANE, LEFT_LANE do
    L4_73 = -1
    L5_74 = -1
    for L9_78 = FRONT_TOWER, BACK_TOWER, -1 do
      orderTurret = GetTurret(TEAM_ORDER, L3_72, L9_78)
      if orderTurret ~= nil and L4_73 == -1 then
        L4_73 = L9_78
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L3_72, L9_78)
      if chaosTurret ~= nil and L5_74 == -1 then
        L5_74 = L9_78
      end
    end
    for L9_78 = BACK_TOWER, HQ_TOWER1 do
      orderTurret = GetTurret(TEAM_ORDER, L3_72, L9_78)
      if orderTurret ~= nil then
        if L9_78 == L4_73 then
          SetInvulnerable(orderTurret, false)
          SetTargetable(orderTurret, true)
        else
          SetInvulnerable(orderTurret, true)
          SetNotTargetableToTeam(orderTurret, true, TEAM_CHAOS)
        end
      end
      chaosTurret = GetTurret(TEAM_CHAOS, L3_72, L9_78)
      if chaosTurret ~= nil then
        if L9_78 == L5_74 then
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
function ResetToDefaultWaveCounts(A0_79)
  local L1_80, L2_81
  for _FORV_6_, _FORV_7_ in pairs(A0_79) do
    _FORV_7_.NumPerWave = _FORV_7_.DefaultNumPerWave
  end
end
function ClearCurrentWaveCounts(A0_82)
  local L1_83, L2_84
  for _FORV_6_, _FORV_7_ in pairs(A0_82) do
    _FORV_7_.NumPerWave = 0
  end
end
function GetInitSpawnInfo(A0_85, A1_86)
  local L2_87, L3_88, L4_89
  L2_87 = 0
  L3_88 = TEAM_ORDER
  if A1_86 == L3_88 then
    L3_88 = OrderBarracksBonuses
    L4_89 = A0_85 + 1
    L2_87 = L3_88[L4_89]
  else
    L3_88 = ChaosBarracksBonuses
    L4_89 = A0_85 + 1
    L2_87 = L3_88[L4_89]
  end
  L3_88 = {}
  L4_89 = SpawnTable
  L4_89 = L4_89.WaveSpawnRate
  L3_88.WaveSpawnRate = L4_89
  L4_89 = SpawnTable
  L4_89 = L4_89.SingleMinionSpawnDelay
  L3_88.SingleMinionSpawnDelay = L4_89
  L4_89 = L2_87.IsDestroyed
  L3_88.IsDestroyed = L4_89
  L4_89 = L2_87.MinionInfoTable
  L3_88.MinionInfoTable = L4_89
  ReturnTable = L3_88
  L3_88 = ReturnTable
  return L3_88
end
function GetMinionSpawnInfo(A0_90, A1_91, A2_92, A3_93, A4_94)
  local L5_95, L6_96, L7_97
  L5_95 = 0
  L6_96 = TEAM_ORDER
  if A3_93 == L6_96 then
    L6_96 = OrderBarracksBonuses
    L7_97 = A0_90 + 1
    L5_95 = L6_96[L7_97]
  else
    L6_96 = ChaosBarracksBonuses
    L7_97 = A0_90 + 1
    L5_95 = L6_96[L7_97]
  end
  L6_96 = L5_95.MinionInfoTable
  L6_96 = L6_96.Super
  L7_97 = L5_95.MinionInfoTable
  L7_97 = L7_97.Cannon
  ResetToDefaultWaveCounts(L5_95.MinionInfoTable)
  if A1_91 % CANNON_MINION_SPAWN_FREQUENCY == 0 then
    L7_97.NumPerWave = L7_97.NumPerWave + 1
  end
  if A4_94 ~= LAST_WAVE then
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
    LAST_WAVE = A4_94
  end
  if L5_95.WillSpawnSuperMinion == 1 then
    if A3_93 == TEAM_ORDER and totalNumberOfChaosBarracks == 0 or A3_93 == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
      L6_96.NumPerWave = 2
    else
      L6_96.NumPerWave = 1
    end
    L7_97.NumPerWave = 0
  end
  if SPECIAL_MINION_MODE == "2MeleeMinions" then
    ClearCurrentWaveCounts(L5_95.MinionInfoTable)
    L6_96.NumPerWave = L5_95.MinionInfoTable.Super.NumPerWave
    L5_95.MinionInfoTable.Melee.NumPerWave = math.max(2 - L5_95.MinionInfoTable.Super.NumPerWave, 0)
  elseif SPECIAL_MINION_MODE == "None" then
    ClearCurrentWaveCounts(L5_95.MinionInfoTable)
  end
  if GetMutatorParameterBool("SuppressMinionSpawn") then
    SuppressMinionSpawnForBarrack(L5_95)
  end
  ReturnTable = {
    NewFormat = true,
    SpawnOrderMinionNames = L5_95.SpawnOrderMinionNames,
    IsDestroyed = L5_95.IsDestroyed,
    ExperienceRadius = SpawnTable.ExpRadius,
    GoldRadius = SpawnTable.GoldRadius,
    MinionInfoTable = L5_95.MinionInfoTable
  }
  return ReturnTable
end
function DeactivateCorrectStructure(A0_98, A1_99, A2_100)
  local L3_101, L4_102
  L4_102 = TEAM_ORDER
  if A0_98 == L4_102 then
    L3_101 = OrderBuildingStatus
  else
    L3_101 = ChaosBuildingStatus
  end
  L4_102 = FRONT_TOWER
  if A2_100 == L4_102 then
    L4_102 = A1_99 + 1
    L4_102 = L3_101[L4_102]
    L4_102.Turret3 = false
    L4_102 = GetTurret
    L4_102 = L4_102(A0_98, A1_99, MIDDLE_TOWER)
    SetInvulnerable(L4_102, false)
    SetTargetable(L4_102, true)
    SetLaneTowerCount(A0_98, A1_99, 2)
  else
    L4_102 = MIDDLE_TOWER
    if A2_100 == L4_102 then
      L4_102 = A1_99 + 1
      L4_102 = L3_101[L4_102]
      L4_102.Turret2 = false
      L4_102 = GetTurret
      L4_102 = L4_102(A0_98, A1_99, BACK_TOWER)
      SetInvulnerable(L4_102, false)
      SetTargetable(L4_102, true)
      SetLaneTowerCount(A0_98, A1_99, 1)
    else
      L4_102 = BACK_TOWER
      if A2_100 == L4_102 then
        L4_102 = A1_99 + 1
        L4_102 = L3_101[L4_102]
        L4_102.Turret1 = false
        L4_102 = GetDampener
        L4_102 = L4_102(A0_98, A1_99)
        SetInvulnerable(L4_102, false)
        SetTargetable(L4_102, true)
        SetLaneTowerCount(A0_98, A1_99, 0)
      else
        L4_102 = HQ_TOWER2
        if A2_100 == L4_102 then
          L3_101.HQTower2 = false
          L4_102 = L3_101.HQTower1
          if L4_102 == false then
            L4_102 = GetHQ
            L4_102 = L4_102(A0_98)
            SetInvulnerable(L4_102, false)
            SetTargetable(L4_102, true)
          end
        else
          L4_102 = HQ_TOWER1
          if A2_100 == L4_102 then
            L3_101.HQTower1 = false
            L4_102 = L3_101.HQTower2
            if L4_102 == false then
              L4_102 = GetHQ
              L4_102 = L4_102(A0_98)
              SetInvulnerable(L4_102, false)
              SetTargetable(L4_102, true)
            end
          end
        end
      end
    end
  end
end
function GetLuaBarracks(A0_103, A1_104)
  local L2_105, L3_106, L4_107
  L3_106 = TEAM_ORDER
  if A0_103 == L3_106 then
    L3_106 = OrderBarracksBonuses
    L4_107 = A1_104 + 1
    L2_105 = L3_106[L4_107]
  else
    L3_106 = ChaosBarracksBonuses
    L4_107 = A1_104 + 1
    L2_105 = L3_106[L4_107]
  end
  return L2_105
end
function GetDisableMinionSpawnTime(A0_108, A1_109)
  barrack = GetLuaBarracks(A1_109, A0_108)
  return DISABLE_MINION_SPAWN_BASE_TIME + DISABLE_MINION_SPAWN_MAG_TIME * barrack.NumOfSpawnDisables
end
function DisableBarracksSpawn(A0_110, A1_111)
  cLangBarracks = GetBarracks(A1_111, A0_110)
  luaBarrack = GetLuaBarracks(A1_111, A0_110)
  SetDisableMinionSpawn(cLangBarracks, GetDisableMinionSpawnTime(A0_110, A1_111))
  luaBarrack.NumOfSpawnDisables = luaBarrack.NumOfSpawnDisables + 1
end
BonusesCounter = 0
function ApplyBarracksDestructionBonuses(A0_112, A1_113)
  local L2_114, L3_115, L4_116, L5_117, L6_118, L7_119, L8_120, L9_121, L10_122
  BonusesCounter = L2_114
  for L5_117 = 1, 3 do
    L6_118, L7_119 = nil, nil
    L8_120 = TEAM_ORDER
    if A0_112 == L8_120 then
      L7_119 = TEAM_CHAOS
      L6_118 = OrderBarracksBonuses
      L8_120 = ChaosBarracksBonuses
      EnemyBarracks = L8_120
    else
      L7_119 = TEAM_ORDER
      L6_118 = ChaosBarracksBonuses
      L8_120 = OrderBarracksBonuses
      EnemyBarracks = L8_120
    end
    L8_120, L9_121 = nil, nil
    L10_122 = L6_118[L5_117]
    L10_122 = L10_122.MinionInfoTable
    for _FORV_14_, _FORV_15_ in pairs(L10_122) do
      _FORV_15_.HPBonus = _FORV_15_.HPBonus + _FORV_15_.HPInhibitor
      _FORV_15_.DamageBonus = _FORV_15_.DamageBonus + _FORV_15_.DamageInhibitor
      _FORV_15_.ExpGiven = _FORV_15_.ExpGiven - _FORV_15_.ExpInhibitor
      _FORV_15_.GoldGiven = _FORV_15_.GoldGiven - _FORV_15_.GoldInhibitor
    end
    if L5_117 == A1_113 + 1 then
      L6_118[L5_117].WillSpawnSuperMinion = 1
      if A0_112 == TEAM_ORDER then
        totalNumberOfChaosBarracks = totalNumberOfChaosBarracks - 1
      else
        totalNumberOfOrderBarracks = totalNumberOfOrderBarracks - 1
      end
    end
  end
end
ReductionCounter = 0
function ApplyBarracksRespawnReductions(A0_123, A1_124)
  local L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134, L12_135, L13_136, L14_137, L15_138, L16_139, L17_140, L18_141
  ReductionCounter = L2_125
  for L5_128 = 1, 3 do
    L6_129, L7_130, L8_131 = nil, nil, nil
    L9_132 = TEAM_ORDER
    if A0_123 == L9_132 then
      L8_131 = TEAM_CHAOS
      L6_129 = OrderBarracksBonuses
      L7_130 = ChaosBarracksBonuses
    else
      L8_131 = TEAM_ORDER
      L6_129 = ChaosBarracksBonuses
      L7_130 = OrderBarracksBonuses
    end
    L9_132, L10_133 = nil, nil
    L11_134 = L6_129[L5_128]
    L11_134 = L11_134.MinionInfoTable
    for L15_138, L16_139 in L12_135(L13_136) do
      L17_140 = L16_139.HPBonus
      L18_141 = L16_139.HPInhibitor
      L17_140 = L17_140 - L18_141
      L16_139.HPBonus = L17_140
      L17_140 = L16_139.DamageBonus
      L18_141 = L16_139.DamageInhibitor
      L17_140 = L17_140 - L18_141
      L16_139.DamageBonus = L17_140
      L17_140 = L16_139.ExpGiven
      L18_141 = L16_139.ExpInhibitor
      L17_140 = L17_140 + L18_141
      L16_139.ExpGiven = L17_140
      L17_140 = L16_139.GoldGiven
      L18_141 = L16_139.GoldInhibitor
      L17_140 = L17_140 + L18_141
      L16_139.GoldGiven = L17_140
    end
    if L5_128 == L13_136 then
      if A0_123 == L13_136 then
        totalNumberOfChaosBarracks = L13_136
      else
        totalNumberOfOrderBarracks = L13_136
      end
      L13_136.WillSpawnSuperMinion = 0
      L16_139 = false
      L13_136(L14_137, L15_138, L16_139)
    end
    if L12_135 == 3 then
      HQ = L13_136
      L13_136(L14_137, L15_138)
      L13_136(L14_137, L15_138)
      for L16_139 = RIGHT_LANE, LEFT_LANE do
        L17_140 = GetTurret
        L18_141 = L8_131
        L17_140 = L17_140(L18_141, L16_139, HQ_TOWER1)
        L18_141 = GetTurret
        L18_141 = L18_141(L8_131, L16_139, HQ_TOWER2)
        if L17_140 ~= Nil then
          SetInvulnerable(L17_140, true)
          SetNotTargetableToTeam(L17_140, true, A0_123)
        end
        if L18_141 ~= Nil then
          SetInvulnerable(L18_141, true)
          SetNotTargetableToTeam(L18_141, true, A0_123)
        end
      end
    end
  end
end
ReactiveCounter = 0
function BarrackReactiveEvent(A0_142, A1_143)
  local L2_144
  ReactiveCounter = ReactiveCounter + 1
  L2_144 = OppositeTeam(A0_142)
  dampener = GetDampener(A0_142, A1_143)
  SetInvulnerable(dampener, false)
  SetTargetable(dampener, true)
  ApplyBarracksRespawnReductions(L2_144, A1_143)
end
function DisableSuperMinions(A0_145, A1_146)
  local L2_147, L3_148
  if A0_145 == TEAM_ORDER then
    L2_147 = OrderBarracksBonuses[A1_146 + 1]
    L3_148 = ChaosBarracksBonuses[A1_146 + 1]
  elseif A0_145 == TEAM_CHAOS then
    L2_147 = ChaosBarracksBonuses[A1_146 + 1]
    L3_148 = OrderBarracksBonuses[A1_146 + 1]
  end
  if L3_148 then
    L3_148.WillSpawnSuperMinion = 0
  end
end
function OnJumpToMidGameCheat(A0_149)
  local L1_150
  L1_150 = GetTurret
  L1_150 = L1_150(TEAM_ORDER, 1, HQ_TOWER1)
  if A0_149 == 0 then
    ApplyPersistentBuff(L1_150, "DebugMidGameBuff", false, 1, 1)
  else
    ApplyPersistentBuff(L1_150, "DebugLateGameBuff", false, 1, 1)
  end
end
function EqualizeDragonsCheat()
  local L0_151
  L0_151 = GetTurret
  L0_151 = L0_151(TEAM_ORDER, 1, 0)
  ApplyPersistentBuff(L0_151, "DebugEqualizeDragons", false, 1, 1)
end
function OnBarracksToggled(A0_152)
  local L1_153
  if A0_152 == 0 then
  end
end
DisactivatedCounter = 0
function HandleDestroyedObject(A0_154)
  local L1_155, L2_156, L3_157
  L1_155 = GetHQType
  L2_156 = A0_154
  L1_155 = L1_155(L2_156)
  HQType = L1_155
  L1_155 = HQType
  L2_156 = ORDER_HQ
  if L1_155 ~= L2_156 then
    L1_155 = HQType
    L2_156 = CHAOS_HQ
  elseif L1_155 == L2_156 then
    L1_155 = HQType
    L2_156 = CHAOS_HQ
    if L1_155 == L2_156 then
      L1_155 = EndOfGameCeremony
      L2_156 = TEAM_ORDER
      L3_157 = A0_154
      L1_155(L2_156, L3_157)
    else
      L1_155 = EndOfGameCeremony
      L2_156 = TEAM_CHAOS
      L3_157 = A0_154
      L1_155(L2_156, L3_157)
    end
    return
  end
  L1_155 = IsDampener
  L2_156 = A0_154
  L1_155 = L1_155(L2_156)
  if L1_155 then
    L1_155 = GetLinkedBarrack
    L2_156 = A0_154
    L1_155 = L1_155(L2_156)
    barrack = L1_155
    L1_155 = GetTeamID
    L2_156 = barrack
    L1_155 = L1_155(L2_156)
    barrackTeam = L1_155
    L1_155 = GetLane
    L2_156 = A0_154
    L1_155 = L1_155(L2_156)
    barrackLane = L1_155
    L1_155 = SetLaneExposed
    L2_156 = barrackTeam
    L3_157 = barrackLane
    L1_155(L2_156, L3_157, true)
    L1_155 = DisableBarracksSpawn
    L2_156 = barrackLane
    L3_157 = barrackTeam
    L1_155(L2_156, L3_157)
    L1_155 = SetDampenerState
    L2_156 = A0_154
    L3_157 = DampenerRegenerationState
    L1_155(L2_156, L3_157)
    L1_155 = SetInvulnerable
    L2_156 = A0_154
    L3_157 = true
    L1_155(L2_156, L3_157)
    L1_155 = SetTargetable
    L2_156 = A0_154
    L3_157 = false
    L1_155(L2_156, L3_157)
    L1_155 = DisactivatedCounter
    L1_155 = L1_155 + 1
    DisactivatedCounter = L1_155
    L1_155 = GetTurret
    L2_156 = barrackTeam
    L3_157 = 1
    L1_155 = L1_155(L2_156, L3_157, HQ_TOWER1)
    L2_156 = GetTurret
    L3_157 = barrackTeam
    L2_156 = L2_156(L3_157, 1, HQ_TOWER2)
    L3_157 = Nil
    if L1_155 ~= L3_157 then
      L3_157 = SetInvulnerable
      L3_157(L1_155, false)
      L3_157 = SetTargetable
      L3_157(L1_155, true)
    end
    L3_157 = Nil
    if L2_156 ~= L3_157 then
      L3_157 = SetInvulnerable
      L3_157(L2_156, false)
      L3_157 = SetTargetable
      L3_157(L2_156, true)
    end
    L3_157 = Nil
    if L1_155 == L3_157 then
      L3_157 = Nil
      if L2_156 == L3_157 then
        L3_157 = GetHQ
        L3_157 = L3_157(barrackTeam)
        SetInvulnerable(L3_157, false)
        SetTargetable(L3_157, true)
      end
    end
    L3_157 = nil
    if barrackTeam == TEAM_CHAOS then
      L3_157 = TEAM_ORDER
    else
      L3_157 = TEAM_CHAOS
    end
    ApplyBarracksDestructionBonuses(L3_157, barrackLane)
  end
  L1_155 = IsTurretAI
  L2_156 = A0_154
  L1_155 = L1_155(L2_156)
  if L1_155 then
    L1_155 = GetTeamID
    L2_156 = A0_154
    L1_155 = L1_155(L2_156)
    L2_156 = GetObjectLaneId
    L3_157 = A0_154
    L2_156 = L2_156(L3_157)
    L3_157 = GetTurretPosition
    L3_157 = L3_157(A0_154)
    DeactivateCorrectStructure(L1_155, L2_156, L3_157)
    return
  end
  L1_155 = GetDampenerType
  L2_156 = A0_154
  L1_155 = L1_155(L2_156)
  if L1_155 > -1 then
    L2_156 = 0
    L3_157 = TEAM_ORDER
    if L1_155 % TEAM_CHAOS >= RIGHT_LANE and L1_155 % TEAM_CHAOS <= LEFT_LANE then
      L2_156 = ChaosBarracksBonuses[L1_155 % TEAM_CHAOS + 1]
      ChaosBuildingStatus[L1_155 % TEAM_CHAOS + 1].Barracks = false
    else
      L3_157 = TEAM_CHAOS
      L2_156 = OrderBarracksBonuses[L1_155 % TEAM_CHAOS - TEAM_ORDER + 1]
      OrderBuildingStatus[L1_155 % TEAM_CHAOS - TEAM_ORDER + 1].Barracks = false
    end
  else
    L2_156 = Log
    L3_157 = "Could not find Linking barracks!"
    L2_156(L3_157)
  end
  L2_156 = true
  return L2_156
end
function SetLaneExposed(A0_158, A1_159, A2_160)
  if A0_158 == TEAM_ORDER then
    if A1_159 == LEFT_LANE then
      SetWorldVar("OrderTopLaneExposed", A2_160)
    elseif A1_159 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneExposed", A2_160)
    else
      SetWorldVar("OrderMidLaneExposed", A2_160)
    end
  elseif A1_159 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneExposed", A2_160)
  elseif A1_159 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneExposed", A2_160)
  else
    SetWorldVar("ChaosMidLaneExposed", A2_160)
  end
end
function SetLaneTowerCount(A0_161, A1_162, A2_163)
  if A0_161 == TEAM_ORDER then
    if A1_162 == LEFT_LANE then
      SetWorldVar("OrderTopLaneTowerCount", A2_163)
    elseif A1_162 == RIGHT_LANE then
      SetWorldVar("OrderBotLaneTowerCount", A2_163)
    else
      SetWorldVar("OrderMidLaneTowerCount", A2_163)
    end
  elseif A1_162 == LEFT_LANE then
    SetWorldVar("ChaosTopLaneTowerCount", A2_163)
  elseif A1_162 == RIGHT_LANE then
    SetWorldVar("ChaosBotLaneTowerCount", A2_163)
  else
    SetWorldVar("ChaosMidLaneTowerCount", A2_163)
  end
end
function IncreaseCannonMinionSpawnRate()
  local L1_164
  L1_164 = 2
  CANNON_MINION_SPAWN_FREQUENCY = L1_164
end
function IncreaseCannonMinionSpawnRateAgain()
  local L1_165
  L1_165 = 1
  CANNON_MINION_SPAWN_FREQUENCY = L1_165
end
function InitialUpdateAmbientGold()
  UpdateAmbientGold()
  InitTimer("UpdateAmbientGold", 10, true)
end
function UpdateAmbientGold()
  local L0_166, L1_167, L2_168, L3_169, L4_170, L5_171, L6_172, L7_173, L8_174, L9_175, L10_176, L11_177, L12_178, L13_179, L14_180, L15_181, L16_182
  L0_166 = dynamicAmbientGold
  L1_167 = DYNAMIC_AMBIENT_GOLD_INCREASE_PER_10
  L0_166 = L0_166 + L1_167
  dynamicAmbientGold = L0_166
  L0_166 = BASE_AMBIENT_GOLD
  baseAmbientGold = L0_166
  L0_166 = dynamicAmbientGold
  additionalAmbientGold = L0_166
  L0_166 = additionalAmbientGold
  if L0_166 == 0 then
    return
  end
  L0_166 = GetPlayers
  L1_167 = TEAM_CHAOS
  L0_166 = L0_166(L1_167)
  L1_167 = -1
  L2_168 = 0
  L3_169 = {}
  L4_170, L5_171 = nil, nil
  for L9_175, L10_176 in L6_172(L7_173) do
    if L9_175 > L1_167 then
      L1_167 = L9_175
    end
    L11_177 = GetPlayerNetWorth
    L11_177 = L11_177(L12_178)
    netWorth = L11_177
    L11_177 = table
    L11_177 = L11_177.insert
    L13_179.Player = L10_176
    L13_179.Worth = L14_180
    L11_177(L12_178, L13_179)
    L11_177 = netWorth
    L2_168 = L2_168 + L11_177
    L11_177 = SetPlayerAmbientGold
    L11_177(L12_178, L13_179)
  end
  L1_167 = L1_167 + 1
  L9_175 = {}
  L10_176, L11_177 = nil, nil
  for L15_181, L16_182 in L12_178(L13_179) do
    netWorth = GetPlayerNetWorth(L16_182)
    table.insert(L9_175, {Player = L16_182, Worth = netWorth})
    SetPlayerAmbientGold(L16_182, baseAmbientGold)
  end
  if L12_178 < 10 then
    return
  end
  L12_178(L13_179, L14_180)
  L12_178(L13_179, L14_180)
  L15_181 = L3_169[5]
  L15_181 = L15_181.Worth
  L15_181 = L12_178 / L15_181
  L16_182 = L9_175[4]
  L16_182 = L16_182.Worth
  L16_182 = L13_179 / L16_182
  SetPlayerAmbientGold(L3_169[4].Player, additionalAmbientGold * (L14_180 / (L14_180 + L15_181)) + baseAmbientGold)
  SetPlayerAmbientGold(L3_169[5].Player, additionalAmbientGold * (L15_181 / (L14_180 + L15_181)) + baseAmbientGold)
  SetPlayerAmbientGold(L9_175[4].Player, additionalAmbientGold * (L16_182 / (L16_182 + L13_179 / L9_175[5].Worth)) + baseAmbientGold)
  SetPlayerAmbientGold(L9_175[5].Player, additionalAmbientGold * (L13_179 / L9_175[5].Worth / (L16_182 + L13_179 / L9_175[5].Worth)) + baseAmbientGold)
end
function PostGameSetup(A0_183)
  POST_GAME_EVENTS = {}
end
function PostGameUpdate(A0_184, A1_185)
  local L2_186, L3_187, L4_188, L5_189, L6_190, L7_191
  for L7_191, _FORV_8_ in L4_188(L5_189) do
    if A0_184 > _FORV_8_.delay then
      ClientSide_CameraMoveCameraFromCurrentPositionToPoint(_FORV_8_.cameraLocation, _FORV_8_.travelTime)
      if _FORV_8_.soundFile then
        ClientSide_PlaySoundFile(_FORV_8_.soundFile)
      end
      table.remove(POST_GAME_EVENTS, L7_191)
      break
    end
  end
end
