import { ethers } from "hardhat";

async function main() {
  console.log("=== Deploying DAO Contracts ===");

  const InvestmentToken = await ethers.getContractFactory("InvestmentToken");
  const investmentToken = await InvestmentToken.deploy();
  await investmentToken.deployed();
  console.log("InvestmentToken deployed at", investmentToken.address);

  const Governance = await ethers.getContractFactory("Governance");
  const governance = await Governance.deploy(investmentToken.address);
  await governance.deployed();
  console.log("Governance deployed at", governance.address);

  const Treasury = await ethers.getContractFactory("Treasury");
  const treasury = await Treasury.deploy(investmentToken.address);
  await treasury.deployed();
  console.log("Treasury deployed at", treasury.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
