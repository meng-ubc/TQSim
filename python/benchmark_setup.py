setup = {
    # Total shots
    'total_shots'  : 32000,
    
    # Error rates
    'single_error_rate' : 0.001,
    'two_error_rate'    : 0.015,
    
    # Boundary values
    'min_gates'   : 50,
    'max_subcircs'   : 10,
    
    # Target test for experiment
    'target_test'   : "accuracy" # for accuracy test or "speedup" for speedup test
    }