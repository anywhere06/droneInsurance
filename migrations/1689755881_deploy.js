const history = artifacts.require("DroneInsuranceHistory");

module.exports = function(deployer) {
    // Use deployer to state migration tasks.
    // TEST NET
    // darootech / account#1 / account#2
    const addresses = ["0x29369DaFF8078586cDADae7CCA5c37B7c456d90c","0xd9F895A6acde50da11309c33FE5E6DA0ED5d0B82","0x03c0fD8FCd8CeC6FfE2A0e1d58F774b9Ffe00bd4"];
    // Develop
    //const addresses = ["0xf956D284afD48cCfa966528B8A8F1878e90B6b5C","0xa16f99b7c11F80a055EcFcE8A4Bf1cbC6C84884f"];
    deployer.deploy(history, addresses);
};
