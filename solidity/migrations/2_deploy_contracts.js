var NashTechAuction = artifacts.require("./NashTechAuction.sol");

module.exports = function(deployer){
    deployer.deploy(NashTechAuction, 300, "0x92eb755ee7c146105988c92bb08a6fe03eab1280");
};