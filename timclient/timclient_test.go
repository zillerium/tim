// Copyright 2016 The go-ethereum Authors - Modified by TIM Authors - Notified with Courtesy
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

package ethclient

import "github.com/tim-coin/tim"

// Verify that Client implements the tim interfaces.
var (
	_ = tim.ChainReader(&Client{})
	_ = tim.TransactionReader(&Client{})
	_ = tim.ChainStateReader(&Client{})
	_ = tim.ChainSyncReader(&Client{})
	_ = tim.ContractCaller(&Client{})
	_ = tim.GasEstimator(&Client{})
	_ = tim.GasPricer(&Client{})
	_ = tim.LogFilterer(&Client{})
	_ = tim.PendingStateReader(&Client{})
	// _ = tim.PendingStateEventer(&Client{})
	_ = tim.PendingContractCaller(&Client{})
)
