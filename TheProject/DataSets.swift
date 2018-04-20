//
//  DataSets.swift
//  ProjectPrototype
//
//  Created by JingyiZhang on 2/12/18.
//  Copyright © 2018 jz. All rights reserved.
//

import Foundation
import RealmSwift

//GDP sets---------------------------
class GrossDomesticProduct : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class PersonalConsumptionExpenditures : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class DurableGoods : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class NondurableGoods : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class Services : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class GrossPrivateDomesticInvestment : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class FixedPrivateInvestment : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class ChangeInPrivateInventories : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class PrivateNonresidentialFixedInvestment : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class PrivateResidentialFixedInvestment : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class NetExportsOfGoodsAndServices : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class ExportsOfGoodsAndServices : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class ImportsOfGoodsAndServices : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class GovernmentConsumptionExpendituresAndGrossInvestment : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class FederalConsumptionExpendituresAndGrossInvestment : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class NationalDefenseExpenditures : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class NondefenseExpenditures : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class StateConsumptionExpendituresAndGrossInvestment : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}
//Labor sets------------------------------------
class CivilianNoninstitutionalPopulation : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class CivilianLaborForce : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class EmploymentLevel : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class UnemploymentLevel : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class NotInLaborForce : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}
//Monetary sets-----------------
class MonetaryBase : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class CurrencyInCirculation : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class ReserveBalancesWithFederalReserveBanks : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class M1MoneyStock : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class M2MoneyStock : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}
//Currency Sets------------------
class TradeWeightedUSDollarIndex : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class USUKForeignExchangeRate : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class ChinaUSForeignExchangeRate : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class CanadaUSForeignExchangeRate : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class JapanUSForeignExchangeRate : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}
//Other sets----------------------------
class SP500 : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class DowJonesIndustrialAverage : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class Wilshire5000TotalMarketIndex : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class CBOEVolatilityIndex : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class StLouisFedFinancialStressIndex : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

class StateAndLocalBondsIndex : Object{
    @objc dynamic var Year = ""
    @objc dynamic var data = 0.0
}

