return {
	-- Particle Class Configuration

	--// Cleanup interval of exceeded objects in seconds (Optional if using simple pool)
	POOL_CLEANUP_INTERVAL = 5,

	--// How much each pool should ideally contain
	TARGET_POOL_SIZE = 100,

	--// distance limit in studs for simulating particles
	MAX_DISTANCE_SIMULATION = 100,

	--// Absolute max particles of the same type
	--// Anything beyond will be "stolen"
	MAX_SIMULATIONS_PER_CONTAINER = 100,
}
