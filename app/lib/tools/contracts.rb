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
			{ name: 'Tronix', ticker: 'TRX', address: '0x92a23b787B9119AdADB1F474682232f48D6EB3Fd' },
			{ name: 'VeCHAIN', ticker: 'VEN', address: '0x5cd9f1c602CA78444142568958151027b1334d36' },
			{ name: 'BNB', ticker: 'BNB', address: '0x00C5E04176d95A286fccE0E68c683Ca0bfec8454' },
			{ name: 'Ox', ticker: 'ZRX', address: '0xa3b2d1087bCEBe59d188a23F75620612d967DF72' }
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