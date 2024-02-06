// import
const { ethers, run } = require("hardhat");
//async main
async function main() {
  const SimpleStorageFactory = await ethers.getContractFactory("SimpleStorage");
  console.log("Deploying  contarct...");
  const simpleStorage = await SimpleStorageFactory.deploy();
  // await simpleStorage.deployed();  -> deprecated
  console.log(simpleStorage.target); // gives is the address of the network
}

async function verify(contarctAddress, args) {
  console.log("Veryfing contract...");
  try {
    await run("verify:verify", {
      address: contarctAddress,
      contractArguements: args,
    });
  } catch (e) {
    if (e.message.toLowerCase().inlcudes("alreay verified")) {
      console.log("Already Verified");
    } else {
      console.log(e);
    }
  }
}

//main
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
