import { viem } from "hardhat";

async function main() {
  console.log("🚀 Starting deployment...");

  const contract = await viem.deployContract("SimpleStorage");

  console.log("✅ Contract deployed to:", contract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
