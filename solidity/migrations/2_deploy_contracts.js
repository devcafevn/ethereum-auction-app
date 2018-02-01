var NashTechAuction = artifacts.require("./NashTechAuction.sol");

module.exports = function(deployer){
    deployer.deploy(NashTechAuction, 300000, "0xdd32a93aac51293770f36401c6a172e35ccb4e2d");
};