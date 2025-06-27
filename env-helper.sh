#!/bin/bash

# env-helper.sh - Helper script for managing NEOVIM_ENVIRONMENT

show_help() {
    echo "Environment Helper for Neovim Configuration"
    echo ""
    echo "Usage: $0 [COMMAND] [ENVIRONMENT]"
    echo ""
    echo "Commands:"
    echo "  set <env>     Set NEOVIM_ENVIRONMENT to specified value"
    echo "  unset         Unset NEOVIM_ENVIRONMENT (uses general-dev)"
    echo "  show          Show current NEOVIM_ENVIRONMENT value"
    echo "  list          List available environment configurations"
    echo "  help          Show this help message"
    echo ""
    echo "Available environments:"
    for env_file in lua/env/*.lua; do
        if [ -f "$env_file" ]; then
            env_name=$(basename "$env_file" .lua)
            echo "  - $env_name"
        fi
    done
    echo ""
    echo "Note: Unset, empty, and 'general-dev' are functionally equivalent."
}

case "$1" in
    "set")
        if [ -z "$2" ]; then
            echo "Error: Please specify an environment name"
            echo "Usage: $0 set <environment>"
            exit 1
        fi
        
        if [ ! -f "lua/env/$2.lua" ]; then
            echo "Warning: Environment file 'lua/env/$2.lua' does not exist"
            echo "Available environments:"
            for env_file in lua/env/*.lua; do
                if [ -f "$env_file" ]; then
                    env_name=$(basename "$env_file" .lua)
                    echo "  - $env_name"
                fi
            done
            exit 1
        fi
        
        export NEOVIM_ENVIRONMENT="$2"
        echo "NEOVIM_ENVIRONMENT set to: $2"
        echo "Add this to your shell profile to make it permanent:"
        echo "  export NEOVIM_ENVIRONMENT=\"$2\""
        ;;
        
    "unset")
        unset NEOVIM_ENVIRONMENT
        echo "NEOVIM_ENVIRONMENT has been unset (will use general-dev)"
        echo "Add this to your shell profile to make it permanent:"
        echo "  unset NEOVIM_ENVIRONMENT"
        ;;
        
    "show")
        if [ -z "$NEOVIM_ENVIRONMENT" ]; then
            echo "NEOVIM_ENVIRONMENT is not set (using general-dev)"
        elif [ "$NEOVIM_ENVIRONMENT" = "" ]; then
            echo "NEOVIM_ENVIRONMENT is empty (using general-dev)"
        elif [ "$NEOVIM_ENVIRONMENT" = "general-dev" ]; then
            echo "NEOVIM_ENVIRONMENT = 'general-dev' (general development)"
        else
            echo "NEOVIM_ENVIRONMENT = '$NEOVIM_ENVIRONMENT'"
            if [ -f "lua/env/$NEOVIM_ENVIRONMENT.lua" ]; then
                echo "✓ Environment config file exists"
            else
                echo "✗ Environment config file not found (will fallback to general-dev)"
            fi
        fi
        ;;
        
    "list")
        echo "Available environment configurations:"
        for env_file in lua/env/*.lua; do
            if [ -f "$env_file" ]; then
                env_name=$(basename "$env_file" .lua)
                if [ "$env_name" = "$NEOVIM_ENVIRONMENT" ]; then
                    echo "  * $env_name (current)"
                else
                    echo "  - $env_name"
                fi
            fi
        done
        ;;
        
    "help"|"--help"|"-h"|"")
        show_help
        ;;
        
    *)
        echo "Unknown command: $1"
        echo "Use '$0 help' for usage information"
        exit 1
        ;;
esac
