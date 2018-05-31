Today I'll briefly go through how to query data of an individual crypto address using exploiting the Infura API. I won't go in depth about nodes and sharding but the process is  quite intuitive for those with prior blockchain experience. 

Firstly I'll change my ENV variable & API key to connect to Ethereum so I'll have to mask one of my private keys that I've used. I made commit's earlier and my .yml file in config wasn't ignored by git which is not an issue as I'll toss it no sooner do I complete this app. My global system settings of Github were messed up during the GDPR switch and that has had ramifications on how I monitor cryptos; their volumes, spoofing and especially automated bots.  

Anyways you can see the last blockNumber on the terminal references to the one on Etherscan. 

![Blocknumber](https://user-images.githubusercontent.com/13242902/40787248-10f136e8-64e5-11e8-9f64-8f5e242bf2b0.png)
<hr>
![Etherscan](https://user-images.githubusercontent.com/13242902/40787324-3c206f78-64e5-11e8-9214-6a2e426422d4.png)
<hr>

Now that I have a green light on my connection, I'll load up a list of smart contracts to interact with and help me keep track of different tokens in a wallet. 

To explore Ethereum I will need an abi (application binary interface), which is a set of data which tells me the functions defined on a particular smart contract. I had a smart contract address that I parsed in to view the methods; 

![smart_contract](https://user-images.githubusercontent.com/13242902/40790592-45ee8668-64ed-11e8-85a8-0fd5983abfc9.png)
<hr> 

Whilst creating a new smart contract, a load of mumbo jumbo will be thrown and I can just show a small portion of it, because nobody likes code that looks like an alphabet soup. 

![smart_contract_creation](https://user-images.githubusercontent.com/13242902/40790802-ce239b72-64ed-11e8-886f-f4f8704b4e33.png) 
<hr> 

Next I'll pair ZRX to the abi smart contract and append it to a function (totalSupply) against the ethereum network which should spit out a massive number, (23670192807308367747100902). 

![zrx](https://user-images.githubusercontent.com/13242902/40791190-ce4bb714-64ee-11e8-96f3-a314ed8152a7.png)
<hr> 

Next I'll do some snooping around. I'll grab a random address and using the ZRX *.balanceOf* function, try to see how much it holds. It's possible to do this on the browser by the way but it can be limiting to some extend. A lot of  bash code is boring. So to the UI. 

![zth](https://user-images.githubusercontent.com/13242902/40792195-3e45aec4-64f1-11e8-9ec6-3ae3f3f92804.png)
<hr>

![ethplorer](https://user-images.githubusercontent.com/13242902/40792200-4165a474-64f1-11e8-8528-72124444f8d6.png)
<hr>

I pulled the abi from the zrx contract which adheres to ERC20 protocol making it easy to reuse it in other contracts. I've added the contract on my app and had to stop spring because for some reason it ignores new modules within the console. 

![sc_in_ruby](https://user-images.githubusercontent.com/13242902/40793011-3911a672-64f3-11e8-8677-04cb3f4845fe.png)
<hr> 

Now we can easily watch the five top addresses using the ERC20_ABI contract that we initially grabbed from the console. 

```ruby 
module Tools
    module Contracts 

            def self.get_balances(address)
                contract = $web3.eth.contract(Tools::Contracts::ERC20_ABI)

                Tools::Contracts::TOKENS.each do |token|
                    t = contract.at(token[:address])
                    puts "Balance of #{token[:ticker]}: #{t.balanceOf(address)}"
                    puts "============================"
                end 
            end


        TOKENS = [
            { name: 'EOS', ticker: 'EOS', address: '0x0008Ec9F540Ceb20CDa44EC8503981Ff58a3361B' },
            { name: 'TRONIX', ticker: 'TRX', address: '0x92a23b787B9119AdADB1F474682232f48D6EB3Fd' },
            { name: 'VECHAIN', ticker: 'VEN', address: '0x5cd9f1c602CA78444142568958151027b1334d36' },
            { name: 'BNB', ticker: 'BNB', address: '0x00C5E04176d95A286fccE0E68c683Ca0bfec8454' },
            { name: 'OMGToken', ticker: 'OMG', address: '0x140427a7D27144A4cDa83bD6b9052a63b0c5B589' }
        ]

        ERC20_ABI = [{"constant"=>true, "inputs"=>[], "name"=>"name", "outputs"=>[{"name"=>"", "type"=>"string"}],
         "payable"=>false, "stateMutability"=>"view", "type"=>"function"}, {"constant"=>false, "inputs"=>[{"name"=>"_spender", 
            "type"=>"address"}, {"name"=>"_value", "type"=>"uint256"}], "name"=>"approve", "outputs"=>[{"name"=>"success", 
            "type"=>"bool"}], "payable"=>false, "stateMutability"=>"nonpayable", "type"=>"function"}, {"constant"=>true, "inputs"=>[],
            "name"=>"totalSupply", "outputs"=>[{"name"=>"", "type"=>"uint256"}], "payable"=>false, "stateMutability"=>"view", 
            "type"=>"function"}, {"constant"=>false, "inputs"=>[{"name"=>"_from", "type"=>"address"}, {"name"=>"_to", "type"=>"address"}, 
            {"name"=>"_value", "type"=>"uint256"}], "name"=>"transferFrom", "outputs"=>[{"name"=>"success", "type"=>"bool"}], 
            "payable"=>false, "stateMutability"=>"nonpayable", "type"=>"function"}, {"constant"=>true, "inputs"=>[], "name"=>"decimals", 
            "outputs"=>[{"name"=>"", "type"=>"uint8"}], "payable"=>false, "stateMutability"=>"view", "type"=>"function"},
            {"constant"=>false, "inputs"=>[{"name"=>"_newController", "type"=>"address"}], "name"=>"changeController", "outputs"=>[],
            "payable"=>false, "stateMutability"=>"nonpayable", "type"=>"function"}, {"constant"=>true, "inputs"=>[], "name"=>"version",
            "outputs"=>[{"name"=>"", "type"=>"string"}], "payable"=>false, "stateMutability"=>"view", "type"=>"function"}, 
            {"constant"=>true, "inputs"=>[{"name"=>"_owner", "type"=>"address"}], "name"=>"balanceOf", "outputs"=>[{"name"=>"balance", 
            "type"=>"uint256"}], "payable"=>false, "stateMutability"=>"view", "type"=>"function"}, {"constant"=>false, 
            "inputs"=>[{"name"=>"_owner", "type"=>"address"}, {"name"=>"_amount", "type"=>"uint256"}], "name"=>"generateTokens", 
            "outputs"=>[{"name"=>"", "type"=>"bool"}], "payable"=>false, "stateMutability"=>"nonpayable", "type"=>"function"}, 
            {"constant"=>true, "inputs"=>[], "name"=>"symbol", "outputs"=>[{"name"=>"", "type"=>"string"}], "payable"=>false, 
            "stateMutability"=>"view", "type"=>"function"}, {"constant"=>false, "inputs"=>[{"name"=>"_to", "type"=>"address"}, 
            {"name"=>"_value", "type"=>"uint256"}], "name"=>"transfer", "outputs"=>[{"name"=>"success", "type"=>"bool"}],
            "payable"=>false, "stateMutability"=>"nonpayable", "type"=>"function"}, {"constant"=>false, 
            "inputs"=>[{"name"=>"_owner", "type"=>"address"}, {"name"=>"_amount", "type"=>"uint256"}], "name"=>"destroyTokens", 
            "outputs"=>[{"name"=>"", "type"=>"bool"}], "payable"=>false, "stateMutability"=>"nonpayable", "type"=>"function"},
            {"constant"=>true, "inputs"=>[{"name"=>"_owner", "type"=>"address"}, {"name"=>"_spender", "type"=>"address"}],
            "name"=>"allowance", "outputs"=>[{"name"=>"remaining", "type"=>"uint256"}], "payable"=>false, 
            "stateMutability"=>"view", "type"=>"function"}, {"constant"=>false, "inputs"=>[{"name"=>"_token", "type"=>"address"}],
             "name"=>"claimTokens", "outputs"=>[], "payable"=>false, "stateMutability"=>"nonpayable", "type"=>"function"}, 
            {"constant"=>true, "inputs"=>[], "name"=>"controller", "outputs"=>[{"name"=>"", "type"=>"address"}], 
            "payable"=>false, "stateMutability"=>"view", "type"=>"function"}, {"inputs"=>[], "payable"=>false, 
            "stateMutability"=>"nonpayable", "type"=>"constructor"}, {"payable"=>true, "stateMutability"=>"payable", 
            "type"=>"fallback"}, {"anonymous"=>false, "inputs"=>[{"indexed"=>true, "name"=>"_token", "type"=>"address"}, 
            {"indexed"=>true, "name"=>"_controller", "type"=>"address"}, {"indexed"=>false, "name"=>"_amount", 
            "type"=>"uint256"}], "name"=>"ClaimedTokens", "type"=>"event"}, {"anonymous"=>false, "inputs"=>[{"indexed"=>true, 
            "name"=>"from", "type"=>"address"}, {"indexed"=>true, "name"=>"to", "type"=>"address"}, {"indexed"=>false, 
            "name"=>"value", "type"=>"uint256"}], "name"=>"Transfer", "type"=>"event"}, {"anonymous"=>false, 
            "inputs"=>[{"indexed"=>true, "name"=>"owner", "type"=>"address"}, {"indexed"=>true, "name"=>"spender", 
            "type"=>"address"}, {"indexed"=>false, "name"=>"value", "type"=>"uint256"}], "name"=>"Approval", 
            "type"=>"event"}]
    end
end
```


To query balance of an address you run  *Tools::Contracts.get_balances('address to query')* in bash and that would spit out whatever balance remains.

It's possible to implement a list and store it at the backend which can scrape data and give an idea of whats happening within the blockchain.











