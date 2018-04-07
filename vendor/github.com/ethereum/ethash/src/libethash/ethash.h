/*
  This file is part of thash.

  thash is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  thash is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with thash.  If not, see <http://www.gnu.org/licenses/>.
*/

/** @file thash.h
* @date 2015
*/
#pragma once

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stddef.h>
#include "compiler.h"

#define thash_REVISION 23
#define thash_DATASET_BYTES_INIT 1073741824U // 2**30
#define thash_DATASET_BYTES_GROWTH 8388608U  // 2**23
#define thash_CACHE_BYTES_INIT 1073741824U // 2**24
#define thash_CACHE_BYTES_GROWTH 131072U  // 2**17
#define thash_EPOCH_LENGTH 30000U
#define thash_MIX_BYTES 128
#define thash_HASH_BYTES 64
#define thash_DATASET_PARENTS 256
#define thash_CACHE_ROUNDS 3
#define thash_ACCESSES 64
#define thash_DAG_MAGIC_NUM_SIZE 8
#define thash_DAG_MAGIC_NUM 0xFEE1DEADBADDCAFE

#ifdef __cplusplus
extern "C" {
#endif

/// Type of a seedhash/blockhash e.t.c.
typedef struct thash_h256 { uint8_t b[32]; } thash_h256_t;

// convenience macro to statically initialize an h256_t
// usage:
// thash_h256_t a = thash_h256_static_init(1, 2, 3, ... )
// have to provide all 32 values. If you don't provide all the rest
// will simply be unitialized (not guranteed to be 0)
#define thash_h256_static_init(...)			\
	{ {__VA_ARGS__} }

struct thash_light;
typedef struct thash_light* thash_light_t;
struct thash_full;
typedef struct thash_full* thash_full_t;
typedef int(*thash_callback_t)(unsigned);

typedef struct thash_return_value {
	thash_h256_t result;
	thash_h256_t mix_hash;
	bool success;
} thash_return_value_t;

/**
 * Allocate and initialize a new thash_light handler
 *
 * @param block_number   The block number for which to create the handler
 * @return               Newly allocated thash_light handler or NULL in case of
 *                       ERRNOMEM or invalid parameters used for @ref thash_compute_cache_nodes()
 */
thash_light_t thash_light_new(uint64_t block_number);
/**
 * Frees a previously allocated thash_light handler
 * @param light        The light handler to free
 */
void thash_light_delete(thash_light_t light);
/**
 * Calculate the light client data
 *
 * @param light          The light client handler
 * @param header_hash    The header hash to pack into the mix
 * @param nonce          The nonce to pack into the mix
 * @return               an object of thash_return_value_t holding the return values
 */
thash_return_value_t thash_light_compute(
	thash_light_t light,
	thash_h256_t const header_hash,
	uint64_t nonce
);

/**
 * Allocate and initialize a new thash_full handler
 *
 * @param light         The light handler containing the cache.
 * @param callback      A callback function with signature of @ref thash_callback_t
 *                      It accepts an unsigned with which a progress of DAG calculation
 *                      can be displayed. If all goes well the callback should return 0.
 *                      If a non-zero value is returned then DAG generation will stop.
 *                      Be advised. A progress value of 100 means that DAG creation is
 *                      almost complete and that this function will soon return succesfully.
 *                      It does not mean that the function has already had a succesfull return.
 * @return              Newly allocated thash_full handler or NULL in case of
 *                      ERRNOMEM or invalid parameters used for @ref thash_compute_full_data()
 */
thash_full_t thash_full_new(thash_light_t light, thash_callback_t callback);

/**
 * Frees a previously allocated thash_full handler
 * @param full    The light handler to free
 */
void thash_full_delete(thash_full_t full);
/**
 * Calculate the full client data
 *
 * @param full           The full client handler
 * @param header_hash    The header hash to pack into the mix
 * @param nonce          The nonce to pack into the mix
 * @return               An object of thash_return_value to hold the return value
 */
thash_return_value_t thash_full_compute(
	thash_full_t full,
	thash_h256_t const header_hash,
	uint64_t nonce
);
/**
 * Get a pointer to the full DAG data
 */
void const* thash_full_dag(thash_full_t full);
/**
 * Get the size of the DAG data
 */
uint64_t thash_full_dag_size(thash_full_t full);

/**
 * Calculate the seedhash for a given block number
 */
thash_h256_t thash_get_seedhash(uint64_t block_number);

#ifdef __cplusplus
}
#endif
