setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100
ingrid.exe --farm-recheck 200 -G -S eth-eu1.nanopool.org:9999 -O 0xB5a9b7402AF83507B77BB56ae12947823502742C
