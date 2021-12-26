pragma solidity 0.7.5;
pragma abicoder v2;
import "@openzeppelin/contracts/utils/access/Ownable.sol"
import "@openzeppelin/contracts/access/AccessControl.sol";

// @notice gets the updates of the onchain activity from yearn lens 
// @dev they dont consist of voting activity , but will try to add them via snapshot integration if possible 

// reference : https://etherscan.io/address/0xff0bd2d0c7e9424ccb149ed3757155eef41a793d#code
interface RegistryAdapterIronBank  {
// for multiple assets details analysis 
    function assetsDynamic(address[] memory _assetsAddresses)
    public
    view
    returns (AssetDynamic[] memory);


    function assetUserMetadata(address accountAddress, address assetAddress)
    public
    view
    returns (AssetUserMetadata memory);

/**
* Fetch underlying token price given a cyToken address
*/
    function assetUnderlyingTokenPriceUsdc(address assetAddress)
    public
    view
    returns (uint256);








    






}
interface ManagementList  {
    
    function managersList() external view returns (address[] memory);



    
}


// for multiple assets details analysisfunction assetsDynamic(address[] memory _assetsAddresses)


/// @title yearn lens update  fetcher
/// @author Dhruv
/// @notice 
/// @dev currently creating only mega-registry of readable contracts  and events , not the executable functions 


// also trying to get the  snapshot  pattern for the zero 

contract YearnUpdates {

// structs for storing the details for the given assetManager , for the adapter for the given marketmaker , etc.
    struct AssetStatic {
        address id; // Asset address
        string typeId; // Asset typeId (for example "VAULT_V2" or "IRON_BANK_MARKET")
        address tokenId; // Underlying token address
        string name; // Asset Name
        string version; // Asset version
        string symbol; // Asset symbol
        uint8 decimals; // Asset decimals
    }

    /**
     * High level dynamic information about an asset
     */
    struct AssetDynamic {
        address id; // Asset address
        string typeId; // Asset typeId (for example "VAULT_V2" or "IRON_BANK_MARKET")
        address tokenId; // Underlying token address;
        TokenAmount underlyingTokenBalance; // Underlying token balances
        AssetMetadata metadata; // Metadata specific to the asset type of this adapter
    }

    /**
     * Information about a user's position relative to an asset
     */
struct Position {
        address assetId; // Asset address
        address tokenId; // Underlying asset token address
        string typeId; // Position typeId (for example "DEPOSIT," "BORROW," "LEND")
        uint256 balance; // asset.balanceOf(account)
        TokenAmount underlyingTokenBalance; // Represents a user's asset position in underlying tokens
        Allowance[] tokenAllowances; // Underlying token allowances
        Allowance[] assetAllowances; // Asset allowances
    }


// registry address contracts . 
address  constant public registryAdapter = 0xFF0bd2d0C7E9424ccB149ED3757155eEf41a793D; // IronBank v2
address  constant public ManagementList =  0xf64e58Ee8C7BadC741A7ea98FB65488084385674;

// mapping  for storing managers metadata.

mapping (address => AssetDynamic) managerDynamicAddress;
mapping (address => AdapterInfo) adapterManagement;

modifier onlyOwner(msg.sender == hasRole());

constructor(
    address owner;
)
{ }


}


