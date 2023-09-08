// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract DroneInsuranceHistory {
    struct PremiumBill {
        uint256 id;
        string contents;
    }

    struct PremiumPayment {
        uint256 id;
        string contents;
    }

    struct InsuranceClaimEvent {
        uint256 id;
        string contents;
    }

    struct InsurancePayout {
        uint256 id;
        string contents;
    }

    struct DrivingScore {
        uint256 id;
        string contents;
    }

    using Counters for Counters.Counter;
    Counters.Counter private premiumBillIdCounter;
    Counters.Counter private premiumPaymentIdCounter;
    Counters.Counter private insuranceClaimEventIdCounter;
    Counters.Counter private insurancePayoutIdCounter;
    Counters.Counter private drivingScoreIdCounter;

    address[] public admins;
    mapping(uint256 => PremiumBill) public premiumBills;
    mapping(uint256 => PremiumPayment) public premiumPayments;
    mapping(uint256 => InsuranceClaimEvent) public insuranceClaimEvents;
    mapping(uint256 => InsurancePayout) public insurancePayouts;
    mapping(uint256 => DrivingScore) public drivingScores;

    // Events to emit counter increments
    event CounterEvent(uint256 newValue);

    constructor(address[] memory _admins) {
        setAdmins(_admins);
    }

    modifier onlyAdmin() {
        require(isAdmin(msg.sender), "Only admin can call this function");
        _;
    }

    function updateAdmins(address[] memory _admins) public onlyAdmin {
        setAdmins(_admins);
    }

    function isAdmin(address addr) private view returns (bool) {
        for (uint256 i = 0; i < admins.length; i++) {
            if (admins[i] == addr) {
                return true;
            }
        }
        return false;
    }

    function setAdmins(address[] memory _admins) private {
        require(_admins.length > 0, "At least one admin address is required");
        admins = _admins;
    }

    function getAllAdmins() public view returns (address[] memory) {
        return admins;
    }

    function getPremiumBill(uint256 id) public view returns (PremiumBill memory) {
        PremiumBill memory data = premiumBills[id];
        return (data);
    }

    function savePremiumBills(PremiumBill[] memory _datas) public onlyAdmin {
        for (uint i = 0; i < _datas.length; i++) {
            PremiumBill memory data = _datas[i];
            uint256 id = data.id;
            if (id == 0) {
                premiumBillIdCounter.increment();
                id = premiumBillIdCounter.current();
            }
            premiumBills[id] = PremiumBill(id, data.contents);
            emit CounterEvent(id);
        }
    }

    function removePremiumBill(uint256 id) public onlyAdmin {
        require(premiumBills[id].id != 0, "Data does not exist");
        delete premiumBills[id];
    }

    function getPremiumPayment(uint256 id) public view returns (PremiumPayment memory) {
        PremiumPayment memory data = premiumPayments[id];
        return (data);
    }

    function savePremiumPayments(PremiumPayment[] memory _datas) public onlyAdmin {
        for (uint i = 0; i < _datas.length; i++) {
            PremiumPayment memory data = _datas[i];
            uint256 id = data.id;
            if (id == 0) {
                premiumPaymentIdCounter.increment();
                id = premiumPaymentIdCounter.current();
            }
            premiumPayments[id] = PremiumPayment(id, data.contents);
            emit CounterEvent(id);
        }
    }

    function removePremiumPayment(uint256 id) public onlyAdmin {
        require(premiumPayments[id].id != 0, "Data does not exist");
        delete premiumPayments[id];
    }

    function getInsuranceClaimEvent(uint256 id) public view returns (InsuranceClaimEvent memory) {
        InsuranceClaimEvent memory data = insuranceClaimEvents[id];
        return (data);
    }

    function saveInsuranceClaimEvents(InsuranceClaimEvent[] memory _datas) public onlyAdmin {
        for (uint i = 0; i < _datas.length; i++) {
            InsuranceClaimEvent memory data = _datas[i];
            uint256 id = data.id;
            if (id == 0) {
                insuranceClaimEventIdCounter.increment();
                id = insuranceClaimEventIdCounter.current();
            }
            insuranceClaimEvents[id] = InsuranceClaimEvent(id, data.contents);
            emit CounterEvent(id);
        }
    }

    function removeInsuranceClaimEvent(uint256 id) public onlyAdmin {
        require(insuranceClaimEvents[id].id != 0, "Data does not exist");
        delete insuranceClaimEvents[id];
    }

    function getInsurancePayout(uint256 id) public view returns (InsurancePayout memory) {
        InsurancePayout memory data = insurancePayouts[id];
        return (data);
    }

    function saveInsurancePayouts(InsurancePayout[] memory _datas) public onlyAdmin {
        for (uint i = 0; i < _datas.length; i++) {
            InsurancePayout memory data = _datas[i];
            uint256 id = data.id;
            if (id == 0) {
                insurancePayoutIdCounter.increment();
                id = insurancePayoutIdCounter.current();
            }
            insurancePayouts[id] = InsurancePayout(id, data.contents);
            emit CounterEvent(id);
        }
    }

    function removeInsurancePayout(uint256 id) public onlyAdmin {
        require(insurancePayouts[id].id != 0, "Data does not exist");
        delete insurancePayouts[id];
    }

    function getDrivingScore(uint256 id) public view returns (DrivingScore memory) {
        DrivingScore memory data = drivingScores[id];
        return (data);
    }

    function saveDrivingScores(DrivingScore[] memory _datas) public onlyAdmin {
        for (uint i = 0; i < _datas.length; i++) {
            DrivingScore memory data = _datas[i];
            uint256 id = data.id;
            if (id == 0) {
                drivingScoreIdCounter.increment();
                id = drivingScoreIdCounter.current();
            }
            drivingScores[id] = DrivingScore(id, data.contents);
            emit CounterEvent(id);
        }
    }

    function removeDrivingScore(uint256 id) public onlyAdmin {
        require(drivingScores[id].id != 0, "Data does not exist");
        delete drivingScores[id];
    }
}
