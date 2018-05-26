// Copyright 2018 The Ethereum Authors - Modified by Tim
// This file is part of the tim library.
//
// The tim library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The tim library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the tim library. If not, see <http://www.gnu.org/licenses/>.

package params

const (
	// These are the multipliers for ether denominations.
	// Example: To get the wei value of an amount in 'douglas', use
	//
	//    new(big.Int).Mul(value, big.NewInt(params.Douglas))
	//
	Paramanu      = 1
	Anu      = 1e3
	Nilve  = 1e6
	Kolve  = 1e9
	Chipte    = 1e12
	Mapte   = 1e15
	Tim    = 1e18
	Sahastra = 1e21
	Sankh  = 1e42

	/*
	Wei      = 1
	Ada      = 1e3
	Babbage  = 1e6
	Shannon  = 1e9
	Szabo    = 1e12
	Finney   = 1e15
	Tim    = 1e18
	Einstein = 1e21
	Douglas  = 1e42
	*/
)
