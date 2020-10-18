#!/bin/bash

echo "$(date)"
echo "Removing your cluster environment."

{ # try
vagrant destroy -f

} || { # catch
    echo ""
        echo "$(date)"
	    echo "The removal procedure FAILED, remove the environment manually."
	        exit -1
		}

		echo "$(date)"
		echo "The cluster environment was removed successfully."

